class UserMailer < ActionMailer::Base
  default :from => "xiao992005@163.com"

  def backup(file)
  	attachments['db.sqlite3'] = File.read(file)
    mail(:to => "xiao992005@163.com",
         :subject => "backup"+Time.now.to_s)
  end

end
