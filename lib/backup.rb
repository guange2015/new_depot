module NewDepot
  module  Backup
    def backup(file_path, key)
      bucket_name = 'backup-firework'
       
      Qiniu::RS.establish_connection! :access_key => 'O-OY8JqX5zOdK7t8VtmeStHvl0rSBJxzsOTgRNJL',
                                      :secret_key => 'tQLaGXPTMYGRvemZTbrdbvTGXBNePD9cj87hYCQk'
       
      token = Qiniu::RS.generate_upload_token :scope => bucket_name
       
       
      Qiniu::RS.upload_file :uptoken            => token,
                            :file               => file_path,
                            :bucket             => bucket_name,
                            :key                => key
                            # :mime_type          => file_mime_type,
                            # :note               => some_notes,
                            # :callback_params    => callback_params,
                            # :enable_crc32_check => false,
                            # :rotate             => auto_rotate
    end

    def backup_by_qiniu
      fireworks = Firework.all
      data_forms = DataForm.all
      data_lists = DataList.all
      content = {fireworks: fireworks, data_forms: data_forms, data_lists: data_lists}.to_json

      require 'zlib'
      require 'stringio'

      
      date = Time.now.strftime('%Y%m%d%H%M')
      path = File.join(Rails.root, "tmp","backup_#{date}.gz")

      Zlib::GzipWriter.open(path) do |gz|
        gz.write content
      end

      
      backup(path, "backup_#{date}")
    end
    
  end
end