class AddCategoryIdToFirework < ActiveRecord::Migration
  def change
    add_reference :fireworks, :category, index: true
  end
end
