class UserMailer < ActionMailer::Base
  default :from => "xiao992005@163.com"

  def backup()
    @fireworks = Firework.all
    @data_forms = DataForm.all
    @data_lists = DataList.all
    #ActiveSupport::JSON.decode json
    mail(:to => "xiao992005@163.com",
         :subject => "backup"+Time.now.to_s)
  end

end
