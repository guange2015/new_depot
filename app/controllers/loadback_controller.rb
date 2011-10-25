require 'net/http'
require 'zlib'
require 'stringio'

class LoadbackController < ActionController::Base
  
  def index
    data = Net::HTTP.get(URI.parse('http://90tian-backup.stor.sinaapp.com/'+params[:id]))
    puts data.length

    content = Zlib::GzipReader.new(StringIO.new(data)).read()

    puts content.length 

    ss = content.split('-'*20)
    if ss.class == Array and ss.length == 3 
      fireworks = ActiveSupport::JSON.decode ss[0]
      insert_data(Firework, fireworks, 'firework')

      data_forms = ActiveSupport::JSON.decode ss[1]
      insert_data(DataForm, data_forms, 'data_form')

      data_lists = ActiveSupport::JSON.decode ss[2]
      insert_data(DataList, data_lists, 'data_list')
      render :text => 'success'
    else
      render :text => 'fail'
    end    
  end
  
  private
  def insert_data(cls, rows, data)
    cls.delete_all
    rows.each do|x|
      id = x[data].delete 'id'
      row = cls.new(x[data])
      row.id = id
      row.save!
    end
  end

end
