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
end
