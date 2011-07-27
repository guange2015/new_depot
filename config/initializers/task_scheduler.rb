# encoding: utf-8
require 'rubygems'
require 'rufus/scheduler'

def execute_scheduler
    # Create your scheduler here
    scheduler = Rufus::Scheduler.start_new  
    logger = Logger.new(Rails.root.to_s + "/log/scheduler.log")

    # Test job
    scheduler.every("1m") do  
        logger.info "Log"
    end
end

execute_scheduler

