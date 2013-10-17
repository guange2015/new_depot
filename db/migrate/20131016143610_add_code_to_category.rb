class AddCodeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :code, :string
  end
end
