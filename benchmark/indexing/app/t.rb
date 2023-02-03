require 'rubygems'
require 'sequel'
require 'benchmark'
require 'mysql2'
require 'date'
require 'ulid'
require 'progress_bar'
require 'awesome_print'

$DB = Sequel.connect("mysql2://admin:Cc123456@dev-cluster-instance-1.cl2cvzlkwjiz.us-west-2.rds.amazonaws.com:3306/dev_books")
$is_save_explain=true
$is_show_sql=false
date_start = Date.parse('2000-01-01')
date_end = Date.parse('2010-01-01')
query_period_days = 90
num_of_list=5000

period_days = query_period_days.to_s
sql_template = "SELECT SQL_NO_CACHE m.`member_id` ,m.`name` ,m.`country_code` ,m.`status` ,b.game_id ,b.amt ,b.bet_time ,b.created_at FROM member m  JOIN bet b ON b.member_id = m.member_id WHERE b.member_id = member_val AND  b.created_at BETWEEN 'created_at_val' AND TIMESTAMPADD(DAY, #{period_days}, 'created_at_val') LIMIT 20;"


    def param_sql(sql_statement, opt)
        #puts opt
        sql_statement = sql_statement.gsub("member_val", opt[:member_id].to_s)
        sql_statement = sql_statement.gsub("created_at_val", opt[:created_at].strftime("%Y-%m-%d"))
    end

    def save_explain(sql)
        sql_explain = "EXPLAIN " + sql
        uid = ULID.generate
        $DB.fetch(sql_explain) do |row|
            $DB[:explain_logs].insert(:uid => uid,
                                      :id => row[:id],
                                      :select_type => row[:select_type],
                                      :table => row[:table],
                                      :partitions => row[:partitions],
                                      :type => row[:type],
                                      :possible_keys => row[:possible_keys],
                                      :key => row[:key],
                                      :key_len => row[:key_len],
                                      :ref => row[:ref],
                                      :rows => row[:rows],
                                      :filtered => row[:filtered],
                                      :Extra => row[:Extra],
                                      :created_at => Time.now.utc
                                        )
        end
    end

$DB[:explain_logs].delete
File.delete('result.csv') if File.exist?('result.csv')
File.delete('search_list.txt') if File.exist?('search_list.txt')
search_list = []
nil_cnt = 0
bar_sl = ProgressBar.new

for a in 1..num_of_list do
    date_a = random_time = rand(date_start..date_end)
    date_b = date_a+1
    #res = $DB[:bet].select(:member_id, :created_at).where(:created_at => (date_a..date_b)).exclude(member_id: [2430,2943,3102,3676,3699,3822,4363,4388,4515,4545,5967,6365,6420,6873,7332,7910,8200,9046,9330,9428] ).first
    res = $DB[:bet].select(:member_id, :created_at).where(:created_at => (date_a..date_b)).where(member_id: [2430,2943,3102,3676,3699,3822,4363,4388,4515,4545,5967,6365,6420,6873,7332,7910,8200,9046,9330,9428] ).first
    #puts "nil" if res.nil?
    if res.nil? then nil_cnt += 1 end
    search_list << res unless res.nil?
    #puts "---- " + a.to_s + " ----"
    #puts search_list
    IO.write("search_list.txt", search_list.join("\n"))
    bar_sl.increment!
end
puts "nil count: " + nil_cnt.to_s
puts "Created list of search data."

bar_query = ProgressBar.new
elapsed_time = Benchmark.realtime do
    search_list.each_with_index do |a, idx|
        #puts "-"*10 + " " + (idx + 1 ).to_s + " " + "-"*10
        sql_exec = param_sql(sql_template, a)
        save_explain(sql_exec) if $is_save_explain
        puts sql_exec if $is_show_sql
        open('result.csv', 'a') {|f|
                f.puts "\n\n" + "-"*10 + " " + (idx + 1 ).to_s + " " + "-"*10 + "\n"
                f.puts sql_exec
                f.puts $DB.fetch(sql_exec).all
                f.puts "-"*10 + " " + (idx + 1 ).to_s + " " + "-"*10 + "\n"
        }
        bar_query.increment!
    end
end

t = elapsed_time * 1000000 / search_list.size
n = search_list.size / elapsed_time
puts "\n"

ops = "select"

puts "operations date range: #{date_start.to_s} ~ #{date_end.to_s}"
puts "operations date period: #{period_days}"
puts "#{ops} operations: #{search_list.size} times"
puts "us per #{ops}: #{t}"
puts "#{ops}s/s: #{n}"

sql_explain_result="SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
ap $DB.fetch(sql_explain_result)
