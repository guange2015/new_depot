class AddCommentToFireworks < ActiveRecord::Migration
  def self.up
  	change_table(:fireworks) do |t|
  		t.column :comment, :string, :limit => 60
  	end
  end

  def self.down
  	remove_column(:fireworks, :comment)
  end
end
