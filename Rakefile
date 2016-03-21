verbose false # eliminate noise from FileUtils library
task default: %w[test]

desc "Run Tests"
task :test do
  sh 'rspec'
end

desc "Show all tasks"
task :task do
  sh 'rake -T'
end

namespace :cron do
  
  desc "Load cronjobs"
  task :start do
    puts "Creating cron jobs from config/schedule.rb..."
    sh 'whenever -w'
    puts "Done."
  end

  desc "Remove all cron jobs"
  task :stop do
    begin
      puts "Removing running jobs."
    sh 'crontab -r'
    puts "Removed all jobs."
    rescue
      puts "No jobs in queue."
    end
  end

  desc "List all cron jobs"
  task :list do |t|
    begin
      puts "Checking for cron jobs..."
      sh 'crontab -l'
    rescue
      puts "No Jobs Running."
    end
  end
end

desc "Show running cron jobs"
task cron: "cron:list"
