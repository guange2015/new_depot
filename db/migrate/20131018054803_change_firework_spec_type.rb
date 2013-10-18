class ChangeFireworkSpecType < ActiveRecord::Migration
  def change
    change_column :fireworks, :spec, :string
  end
end
