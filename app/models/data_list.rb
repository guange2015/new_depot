class DataList < ActiveRecord::Base
  belongs_to :data_form
  belongs_to :firework
end
