class AddBeforeDataToDataList < ActiveRecord::Migration
  def self.up
    add_column :data_lists, :before_data, :integer
  end

  def self.down
    remove_column :data_lists, :before_data
  end
end
