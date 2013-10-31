#coding=utf-8
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

require 'spec_helper'

describe Firework do

  context  "必须要有类别" do
    it "没有类别时" do
      expect(Firework.create(category_id: nil)).to have(1).errors_on(:category_id)
    end

    it "有类别时" do
      expect(Firework.create(category_id: 1)).to have(0).errors_on(:category_id)
    end
  end


end

