namespace :seed do
  desc "load data from excel"
  task load_excel: :environment do
    require 'load_data'
    load_data = NewDepot::LoadData.new
    load_data.load(type: :excel, path: ENV['EXCEL_PATH'] || '/Users/hhuai/Downloads/Book1.xls')
  end

  desc "clear Firework and Category table"
  task clean: :environment do
    Firework.delete_all
    Category.delete_all
  end

end
