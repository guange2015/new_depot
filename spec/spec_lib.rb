#coding=utf-8

module NewDepot
  module SpecLib
    def login(password='3666319')
      visit "/logins/new"
      fill_in "user[password]", :with => password
      click_button "确认"
    end
  end
end