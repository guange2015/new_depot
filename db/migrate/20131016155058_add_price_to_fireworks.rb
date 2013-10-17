class AddPriceToFireworks < ActiveRecord::Migration
  def change
    add_column :fireworks, :price, :float
  end
end
