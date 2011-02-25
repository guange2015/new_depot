class CreateFireworks < ActiveRecord::Migration
  def self.up
    create_table :fireworks do |t|
      t.string :name
      t.integer :spec
      t.integer :lastdata, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :fireworks
  end
end
