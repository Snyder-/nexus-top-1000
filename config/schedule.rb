# File to be used by 'whenever gem'
# type 'whenever -w' to write to cronjob

set :output, "#{Dir.pwd}/log/cron_job_log.txt"
set :job_template, nil

# every :day, :at => '9:51pm' do
# end

every 2.minutes do
  command "cd #{Dir.pwd} && bin/setup"
end
