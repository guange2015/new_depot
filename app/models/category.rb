# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#

class Category < ActiveRecord::Base
  has_many :fireworks

  def self.categories
    ary = []
    roots = where(level: 0)
    roots.each do |root|
      os = where(level: root.id)
      ary << {root: root, cs: os}
    end
    ary
  end

end
