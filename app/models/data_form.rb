# == Schema Information
#
# Table name: data_forms
#
#  id         :integer          not null, primary key
#  comment    :string(255)
#  s_type     :integer
#  state      :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

#coding=utf-8
class DataForm < ActiveRecord::Base
	has_many :data_lists, :dependent => :destroy

	accepts_nested_attributes_for :data_lists,
								  :allow_destroy => true,
								  :reject_if => proc { |t| t['firework_id'].blank? || t['data_number'].blank? }

	validates_presence_of :comment, :message => "公司必须填写"

	def get_type
		s_type==2 ? "出库" : "入库"
	end

	def get_state
		state==1 ? "未完成" : "完成"
	end

	def finished?
		state==2
	end

	def finish!
		self.state = 2
	end
end
