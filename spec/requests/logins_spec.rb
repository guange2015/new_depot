#coding=utf-8

require "spec_helper"

describe "login page" do
  it "goto login page when no logined." do
    get "/"
    response.should redirect_to(new_login_path)
  end

  it "diplays fail message after login error" do
    #user = Factory(:firework, :username => "jdoe", :password => "secret")
    visit "/logins/new"
    fill_in "user[password]", :with => "366631"
    click_button "确认"

    page.should have_content("密码错误")
  end

  it "diplays fail message after login error" do
    visit "/logins/new"
    fill_in "user[password]", :with => "3666319"
    click_button "确认"

    page.should have_content("登出")
  end
end