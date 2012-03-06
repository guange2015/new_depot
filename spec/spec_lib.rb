#coding=utf-8

module NewDepot
  module SpecLib

    def login
      visit "/logins/new"
      fill_in "user[password]", :with => "3666319"
      click_button "确认"

      page.should have_content("登出")
    end

  end
end