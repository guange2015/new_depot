#coding=utf-8
# == Schema Information
# Schema version: 20110226061357
#
# Table name: fireworks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  spec       :integer
#  lastdata   :integer         default(0)
#  created_at :datetime
#  updated_at :datetime
#  comment    :string(60)
#

class Firework < ActiveRecord::Base
	has_many :data_lists
	
	validates_numericality_of :lastdata, :message => "库存必须为数字"
	validates_presence_of :name, :spec, :message => "品名和规格必须填写"
	validates_uniqueness_of :name, :scope => :spec, :message => "此产品已经入库，不需要再入库。"

  def name_spec
    "#{name}==#{spec.to_s}"  
  end
end
