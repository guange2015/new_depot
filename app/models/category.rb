# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#  level      :integer
#  order      :integer
#

class Category < ActiveRecord::Base
  has_many :fireworks, dependent: :destroy

  has_many :nodes,->{order(:order)}, class_name: "Category",
                   foreign_key: :level

  belongs_to :parent, class_name: "Category",
                      foreign_key: :level

  def self.categories
    where(level: 0)
  end

  def resort(ids)
    ids.each_with_index do |id, index|
      record = Category.find(id)
      record.order =  index+1
      record.level = self.id
      record.save!
    end
  end

end
