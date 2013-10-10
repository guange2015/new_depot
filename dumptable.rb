#!/usr/bin/env ruby
require 'date'

DBS = %w( depot_development )
USER = "root" # Username with rights to all those databases, might be root 
PW = "123456" # Password for that username 

today_s = Date.today().to_s
yesterday_s = (Date.today()-(2)).to_s

DBS.each do |db|
  system "mysqldump --user=#{USER} --password=#{PW} --add-drop-database --opt -icC #{db} > /tmp/#{today_s}-#{db}.sql" 
  if File.exist?("/tmp/#{yesterday_s}-#{db}.sql")
    File.unlink("/tmp/#{yesterday_s}-#{db}.sql")
  end
end
