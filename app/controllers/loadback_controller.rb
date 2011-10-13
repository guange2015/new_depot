require 'net/http'
require 'zlib'
require 'stringio'

class LoadbackController < ActionController::Base
  
  def index
    data = Net::HTTP.get(URI.parse('http://90tian-backup.stor.sinaapp.com/201110111548'))
    puts data.length

    content = Zlib::GzipReader.new(StringIO.new(data)).read()

    puts content.length 

    ss = content.split('-'*20)
    if ss.class == Array and ss.length == 3 
      Firework.delete_all
      fireworks = ActiveSupport::JSON.decode ss[0]
      fireworks.each do|x|
        Firework.create!(x["firework"])
      end

      DataForm.delete_all
      data_forms = ActiveSupport::JSON.decode ss[1]
      data_forms.each do |x|
        DataForm.create!(x['data_form'])
      end

      data_lists = ActiveSupport::JSON.decode ss[2]
      DataList.delete_all
      data_lists.each do |x|
        DataList.create!(x['data_list'])
      end
      render :text => 'success'
    else
      render :text => 'fail'
    end
    
  end
end
