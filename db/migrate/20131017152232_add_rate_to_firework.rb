class AddRateToFirework < ActiveRecord::Migration
  def change
    add_column :fireworks, :rate, :Integer
  end
end
