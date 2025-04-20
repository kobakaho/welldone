# Use this file to easily define all of your cron jobs.
require File.expand_path(File.dirname(__FILE__) + "/environment")

# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
ENV.each { |k, v| env(k, v) }
rails_env = ENV["RAILS_ENV"] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

# Example:
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 15.minutes do
    # 1.day, at: "18:00" do #6, 10, 11, 3月の夜18時に送る
    # if [6, 10, 11, 3].include?(Time.current.month)
    rake "user:send"
  # end
end
# Learn more: http://github.com/javan/whenever
