class UserMailer < ActionMailer::Base
  default :from => "xiao992005@163.com"

  def backup(db_file)
    @fireworks = Firework.all
    @data_forms = DataForm.all
    @data_lists = DataList.all
    #ActiveSupport::JSON.decode json
    
    #attachments['backup.db'] = File.read(db_file) if FileTest.exist?(db_file)
    mail(:to => "xiao992005@163.com",
         :subject => "backup"+Time.now.to_s)
  end

end
