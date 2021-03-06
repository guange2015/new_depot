require 'net/http'
require 'zlib'
require 'stringio'
require 'backup'

class LoadbackController < ActionController::Base
  include NewDepot::Backup

  def new
    render :text => backup_by_sae
  end

  def index
    data = Net::HTTP.get(URI.parse('http://90tian-backup.stor.sinaapp.com/'+params[:id]))
    logger.debug data.length

    content = Zlib::GzipReader.new(StringIO.new(data)).read()

    logger.debug content.length 

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
      row.save! unless data == 'data_list' && !x[data]['data_number']
    end
  end

end
