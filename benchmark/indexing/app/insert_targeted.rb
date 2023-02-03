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
date_start = Time.parse('2019-01-01')
date_end = Time.parse('2023-01-01')
min_target_id = 10000
max_target_id = 100000
#specific_target_id=[2430,2943,3102,3676,3699,3822,4363,4388,4515,4545,5967,6365,6420,6873,7332,7910,8200,9046,9330,9428]
num_of_ops=1000
num_of_batch = 50


    def save_bet(opt)
            $DB[:bet].insert(
                             :member_id => opt[:member_id],
                             :game_id => opt[:game_id],
                             :amt => opt[:amt],
                             :bet_time => opt[:bet_time],
                             :created_at => opt[:created_at],
                             :updated_at => opt[:updated_at]  )
    end

bar_sl = ProgressBar.new
counter = 0
for a in 1..num_of_ops do
    opt = Hash.new
    random_time = rand(date_start..date_end).utc.strftime('%Y-%m-%d %H:%M:%S').to_s
    member_id = (defined?(specific_target_id) && specific_target_id.size > 0 ) ? specific_target_id.shuffle.first : rand(min_target_id..max_target_id)
    opt[:bet_time] = random_time
    opt[:created_at] = random_time
    opt[:updated_at] = random_time
    opt[:member_id] = member_id
    opt[:game_id] = rand(1..100)
    opt[:amt] = rand(1..999999)
    save_bet(opt)
    counter += 1
    if counter.divmod(num_of_batch)[1] == 0 then
       puts "#{Time.now.to_s} | Inserted rows: #{counter.to_s}/#{num_of_ops} "
       sleep(1)
    end

    #puts opt
    #bar_sl.increment!
end
