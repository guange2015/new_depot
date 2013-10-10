#coding=utf-8

require "spec_helper"

describe "fireworks page" do
  include NewDepot::SpecLib
  subject { page }
  
  
  context "login success" do
    before(:each) do
      login  
    end
    it {should have_content("登出")}
    it {should have_selector('h1',:text => '仓库库存列表')}
    
  end

  it "should have product name when logined" do
    firework = FactoryGirl.create(:firework)
    login
    expect(page).to have_selector('td',:text => firework.name)
  end  
  
  context "login failed" do
    before(:each) do
      login('no valid password')
    end
    it {should_not have_content("登出")}
  end
end