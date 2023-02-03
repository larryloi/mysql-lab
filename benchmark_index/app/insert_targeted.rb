require 'rubygems'
require 'sequel'
require 'benchmark'
require 'mysql2'
require 'date'
require 'ulid'
require 'progress_bar'

$DB = Sequel.connect("mysql2://admin:Cc123456@dev-cluster-instance-1.cl2cvzlkwjiz.us-west-2.rds.amazonaws.com:3306/dev_books")
$is_save_explain=true
$is_show_sql=false
date_start = Time.parse('2000-01-01')
date_end = Time.parse('2023-01-01')
min_target_id = 1
max_target_id = 100000
num_of_ops=10000000
batch_num = 10000

    def save_bet(opt)
            $DB[:bet].insert(
                             :member_id => opt[:member_id],
                             :game_id => opt[:game_id],
                             :amt => opt[:amt],
                             :bet_time => opt[:bet_time],
                             :created_at => opt[:created_at],
                             :updated_at => opt[:updated_at]
                                        )
    end

bar_sl = ProgressBar.new
counter = 0
for a in 1..num_of_ops do
    opt = Hash.new
    random_time = rand(date_start..date_end).utc.strftime('%Y-%m-%d %H:%M:%S').to_s
    opt[:bet_time] = random_time
    opt[:created_at] = random_time
    opt[:updated_at] = random_time
    opt[:member_id] = rand(min_target_id..max_target_id)
    opt[:game_id] = rand(1..100)
    opt[:amt] = rand(1..999999)
    save_bet(opt)
    if counter.divmod(batch_num)[1] == 0 then
       puts "INSERT COUNT: " + counter.to_s
       sleep(1)
    end
    counter += 1

    #puts opt
    #bar_sl.increment!
end
