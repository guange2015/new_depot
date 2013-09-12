class CreateDataForms < ActiveRecord::Migration
  def self.up
    create_table :data_forms do |t|
      t.string :comment
      t.integer :s_type
      t.integer :state, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :data_forms
  end
end
