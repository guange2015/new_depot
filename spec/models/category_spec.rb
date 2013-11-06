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

require 'spec_helper'

describe Category do

  before do
    @category = FactoryGirl.create(:category)
    10.times.each do |x|
      FactoryGirl.create(:category, level: @category.id)
    end
  end

  describe '# resort' do
    it "正确的重新排序" do
      nodes = @category.nodes.sample(10).map{|x| x.id}
      @category.resort nodes
      @category.reload
      expect(@category.nodes.map{|x| x.id}).to eq(nodes)
    end
  end

  describe '# categories' do
    it "正确索引到子节点" do
      expect(@category.nodes.count).to eq(10)
    end

    it "正确索引到父节点" do
      expect(@category.nodes.first.parent).to eq(@category)
    end

  end
end
