require 'sequel'
require 'mail'

db_host = ENV['DB_HOST']
db_name = ENV['DB_NAME']
db_user = ENV['DB_USER']
db_password = ENV['DB_PASSWORD']
db_port = ENV['DB_PORT']
collect_interval = ENV['COLLECT_INTERVAL_SEC'].to_i
check_period = ENV['CHECK_PERIOD_MIN'].to_i * 60
data_duration = ENV['DATA_DURATION'].to_i
purge_interval = ENV['PURGE_INTERVAL'].to_i * 60

sender_email = ENV['SENDER_EMAIL']
recipient_email = ENV['RECIPIENT_EMAIL']

Mail.defaults do
  delivery_method :smtp, {
    address: ENV['SMTP_ADDRESS'],
    port: ENV['SMTP_PORT'],
    user_name: ENV['SMTP_USER'],
    password: ENV['SMTP_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
end


connection_string = "mysql2://#{db_user}:#{db_password}@#{db_host}:#{db_port}/#{db_name}"

DB = Sequel.connect(connection_string)


wait_time = ENV['WAIT_TIME'].to_i
blocked_session_threshold = ENV['BLOCKED_SESSION_THRESHOLD'].to_i

Sequel.extension :migration
Sequel::Migrator.run(DB, 'db/migrations')

last_check_time = Time.now
last_purge_time = Time.now

loop do
  begin
  results = DB.fetch("SELECT * FROM sys.innodb_lock_waits WHERE wait_age_secs >= ?", wait_time)

  results.each do |row|
    DB[:sess_lock_wait].insert(row)
  end

  blocked_session_count = DB.fetch("SELECT COUNT(*) FROM sys.innodb_lock_waits").first[:count]

    if blocked_session_count && blocked_session_count >= blocked_session_threshold
      DB[:sess_lock_wait].insert(blocked_session_count: blocked_session_count)
    end


    if Time.now - last_check_time >= check_period
      new_rows = DB.fetch("SELECT * FROM sess_lock_wait WHERE wait_started >= ?", last_check_time).all

      unless new_rows.empty?
        html_body = "<h1>New rows in sess_lock_wait table:</h1><ul>"

        new_rows.each do |row|
          html_body << "<li>#{row.inspect}</li>"
        end

        html_body << "</ul>"

        mail = Mail.new do
          from sender_email
          to recipient_email
          subject 'New rows in sess_lock_wait table'
          html_part do
            content_type 'text/html; charset=UTF-8'
            body html_body
          end
        end

        mail.deliver!
      end

      last_check_time = Time.now
    end

    ### purge data if wait_started old than purge data_duration
    if Time.now - last_purge_time >= purge_interval
      DB.run("DELETE FROM sess_lock_wait WHERE wait_started < DATE_SUB(NOW(), INTERVAL ? DAY)", data_duration)
      last_purge_time = Time.now
    end

  rescue => e
    puts "An error occurred: #{e.message}"
  end

  sleep collect_interval
end
