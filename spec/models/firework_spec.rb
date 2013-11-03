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

  describe "校验可靠性" do
    context  "必须要有类别" do
      it "没有类别时" do
        expect(Firework.create(category_id: nil)).to have(1).errors_on(:category_id)
      end

      it "有类别时" do
        expect(Firework.create(category_id: 1)).not_to have(1).errors_on(:category_id)
      end
    end


    context "必须要有名称" do
      it "没有名称时" do
        expect(Firework.create(name: nil)).to have(1).errors_on(:name)
      end

      it "有名称时" do
        expect(Firework.create(name: "name")).not_to have(1).errors_on(:name)
      end
    end

    context "必须要有规格" do
      it "没有规格时" do
        expect(Firework.create(spec: nil)).to have(1).errors_on(:spec)
      end

      it "有规格时" do
        expect(Firework.create(spec: "spec")).not_to have(1).errors_on(:spec)
      end
    end

  end



end

