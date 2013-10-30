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

#coding=utf-8
class Firework < ActiveRecord::Base
	has_many :data_lists
  belongs_to :category
	
	validates_numericality_of :lastdata
	validates_numericality_of :rate
	validates_presence_of :name, :spec
	validates_uniqueness_of :name, :scope => :spec, :message => "此产品已经入库，不需要再入库。"

  def name_spec
    "#{name}==#{spec.to_s}"  
  end
end
