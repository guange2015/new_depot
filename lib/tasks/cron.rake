desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  if Time.now.hour % 4 == 0 # run every four hours
  end

  if Time.now.hour == 0 # run at midnight
    project_path = Rails.root
	  db_file = File.expand_path("db/production.sqlite3",project_path)
	  
	  puts "sending"
	  UserMailer.backup(db_file).deliver		
	  puts "done"
  end
  
end