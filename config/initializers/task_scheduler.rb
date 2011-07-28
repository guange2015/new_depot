# encoding: utf-8
require 'rubygems'
require 'rufus/scheduler'
require 'fileutils'

$logger = Logger.new(Rails.root.to_s + "/log/scheduler.log")
$logger.formatter = proc { |severity, datetime, progname, msg|
    "#{datetime}: #{msg}\n"
  }

def backup
    db_file = Rails.root.to_s + "/db/production.sqlite3"
    db_file_back = Rails.root.to_s + "/db/production.sqlite3.back"
    if FileTest.exist?(db_file_back) && \
       FileUtils.compare_file(db_file,db_file_back)
        $logger.info 'no changed, no backup'
        return
    end
    
    $logger.info db_file 
    $logger.info db_file_back 

    FileUtils.touch db_file_back
    FileUtils.copy_file(db_file,db_file_back)
    UserMailer.backup(db_file_back).deliver
end

def backup_by_sae
  url = 'http://90tian.sinaapp.com/services.php'
  require 'net/http'
  
  fireworks = Firework.all
  data_forms = DataForm.all
  data_lists = DataList.all
  split_s = "-"*20
  content = fireworks.to_json + split_s + data_forms.to_json + split_s + data_lists.to_json
 
  require 'zlib'
  require 'stringio'

  f = StringIO.new 
  gz = Zlib::GzipWriter.new(f)
  gz.write content
  gz.close

  date = Time.now.strftime('%Y%m%d%k%M')
  
  $logger.info Net::HTTP.post_form( URI.parse(url), 
	        {'version'=>date,
		 'content'=>f.string} ).read_body

  f.close unless f.closed?  
end

def execute_scheduler
    # Create your scheduler here
    scheduler = Rufus::Scheduler.start_new  

    # Test job
    scheduler.every("1m") do  
        $logger.info "Log"
    end

    scheduler.every("2h") do
        $logger.info "starting backup"
	begin
          backup_by_sae
        rescue Exception=>e
          $logger.error e.message
	  $logger.error e.backtrace.join("\n")
        end
    end
end

execute_scheduler

