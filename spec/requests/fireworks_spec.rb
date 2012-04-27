#coding=utf-8

require "spec_helper"

describe "fireworks page" do
  include NewDepot::SpecLib
  subject { page }
  
  before :all do
    firework = FactoryGirl.build(:firework)
  end
  
  context "login success" do
    before(:each) do
      login  
    end
    it {should have_content("登出")}
    it {should have_selector('h1',:content => '仓库库存列表')}
    it {should have_selector('td',:content => '大礼花')}
  end
  
  context "login failed" do
    before(:each) do
      login('no valid password')
    end
    it {should_not have_content("登出")}
  end
end