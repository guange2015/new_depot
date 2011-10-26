#coding=utf-8
# Load the rails application
require File.expand_path('../application', __FILE__)
# Initialize the rails application
NewDepot::Application.initialize!

ActionMailer::Base.delivery_method = :smtp  
ActionMailer::Base.smtp_settings = {  
   :address => "smtp.163.com",  
   :port => 25,  
   :domain => "www.163.com",  
   :authentication => :plain,  
   #:authentication => :login,  
   :user_name => "xiao992005@163.com",  
   :password => 'love163.com',
   :openssl_verify_mode => 'none',
   :enable_starttls_auto => false,
   ##:password => ENV["SMTP_PASSWORD"],
}  


WillPaginate::ViewHelpers.pagination_options[:renderer] = 'MyLinkRenderer'
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '上一页'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '下一页'
