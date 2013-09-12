# encoding: utf-8
require 'rubygems'
require 'rufus/scheduler'
require 'fileutils'
require 'backup'

$logger = Logger.new(Rails.root.to_s + "/log/scheduler.log")
$logger.formatter = proc { |severity, datetime, progname, msg|
    "#{datetime}: #{msg}\n"
  }

include NewDepot::Backup

def execute_scheduler
  # Create your scheduler here
  scheduler = Rufus::Scheduler.start_new  

  # Test job
  scheduler.every("1m") do  
      $logger.info "Log"
  end

  scheduler.every("24h") do
    $logger.info "starting backup"
    begin
        $logger.info backup_by_qiniu
    rescue Exception=>e
          $logger.error e.message
          $logger.error e.backtrace.join("\n")
    end
  end
end

pid_file = (Rails.root.to_s + "/tmp/pid_scheduler").to_s
File.delete(pid_file) if FileTest.exists?(pid_file)
if defined?(PhusionPassenger) then
    # Passenger is starting a new process
    PhusionPassenger.on_event(:starting_worker_process) do |forked| 
        # If we are forked and there's no pid file (that is no lock)
        if forked && !FileTest.exists?(pid_file) then
            $logger.debug "SCHEDULER START ON PROCESS #{$$}"
            # Write the current PID on the file
            File.open(pid_file, "w") {
                |f| f.write($$)
            }

            # Execute the scheduler
            execute_scheduler
        end
    end
    # Passenger is shutting down a process.   
    PhusionPassenger.on_event(:stopping_worker_process) do
        # If a pid file exists and the process which 
        # is being shutted down is the same which holds the lock 
        # (in other words, the process which is executing the scheduler)
        # we remove the lock.
        if FileTest.exists?(pid_file) then
            if File.open(pid_file, "r") {|f| pid = f.read.to_i} == $$ then 
                $logger.debug "SCHEDULER STOP ON PROCESS #{$$}"
                File.delete(pid_file)
            end
        end
    end
else # Only execute one scheduler
    execute_scheduler
end
