module NewDepot
  module  Backup
    
    def backup_by_sae
      url = 'http://90tian.sinaapp.com/services.php'
      require 'net/http'

      fireworks = Firework.all
      data_forms = DataForm.all
      data_lists = DataList.all
      split_s = "-"*20
      content = fireworks.to_json + split_s + data_forms.to_json + split_s + data_lists.to_json

      require 'zlib'
      require 'stringio'

      f = StringIO.new 
      gz = Zlib::GzipWriter.new(f)
      gz.write content
      gz.close

      date = Time.now.strftime('%Y%m%d%H%M')

      req_body = Net::HTTP.post_form( URI.parse(url), 
    	        {'version'=>date,
    		 'content'=>f.string} ).read_body

      f.close unless f.closed?  
      
      req_body
    end
    
  end
end