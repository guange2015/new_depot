#coding=utf-8
# == Schema Information
# Schema version: 20110225150309
#
# Table name: data_lists
#
#  id           :integer         not null, primary key
#  data_form_id :integer
#  firework_id  :integer
#  data_number  :integer
#  last_data    :integer
#  s_type       :integer
#  state        :integer         default(1)
#  created_at   :datetime
#  updated_at   :datetime
#

class DataList < ActiveRecord::Base
  belongs_to :data_form
  belongs_to :firework


  attr_accessor :name, :spec

  def get_type
		s_type==2 ? "出库" : "入库"
  end

  def finished?
		state==2
	end

	def finish!
		state=2
	end
end
