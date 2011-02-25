class CreateDataLists < ActiveRecord::Migration
  def self.up
    create_table :data_lists do |t|
      t.references :data_form
      t.references :firework
      t.integer :data_number
      t.integer :last_data
      t.integer :s_type
      t.integer :state,:default=>1

      t.timestamps
    end
  end

  def self.down
    drop_table :data_lists
  end
end
