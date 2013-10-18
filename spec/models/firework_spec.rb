# == Schema Information
#
# Table name: fireworks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  spec        :string(255)
#  lastdata    :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  comment     :string(60)
#  category_id :integer
#  price       :float
#  rate        :integer
#

