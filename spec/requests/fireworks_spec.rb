#coding=utf-8

require "spec_helper"

describe "fireworks page" do
  subject { page }

  def login
    visit "/logins/new"
    fill_in "user[password]", :with => "3666319"
    click_button "确认"

    page.should have_content("登出")
  end

  before :each do
    firework = Factory(:firework)
    login  
  end

  it {should have_selector('h1',:content => '仓库库存列表')}
  it {should have_selector('td',:content => '大礼花')}
end