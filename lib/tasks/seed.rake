namespace :seed do
  desc "load data from excel"
  task load_excel: :environment do
    require 'load_data'
    load_data = NewDepot::LoadData.new
    load_data.load(type: :excel, path: '/Users/hhuai/Downloads/Book1.xls')
  end
end
