#namespace "cron" do
#	desc "backup ..."
#	task :backup => :environment do	
#	
#	project_path = Rails.root
#	db_file = File.expand_path("db/production.sqlite3",project_path)	
#	backup_file = File.expand_path("db/production.#{Time.now.strftime("%Y-%m-%d")}.sqlite3",project_path)
#	puts "starting backup from #{Pathname(db_file).basename} to #{Pathname(backup_file).basename}"
#	FileUtils.copy(db_file,
#		backup_file)
#	
#	puts "sending"
#	UserMailer.backup(backup_file).deliver
#		
#	puts "done"
#	end
#end