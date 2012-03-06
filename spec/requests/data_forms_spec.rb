#coding=utf-8

require 'spec_helper'

include NewDepot::SpecLib

describe "DataForms" do
  
  before :each do 
      login
  end
  
  describe "GET /data_forms" do
    before { visit data_forms_path }
    it {page.should have_selector('h1', :content => "入出库单")}
  end

  describe "入出库单" do
    before { visit data_forms_path }
    it {
      click_link '入库单'  
      page.should have_selector('h1', :content => "入库单")
    }
    it {
      click_link '出库单'  
      page.should have_selector('h1', :content => "出库单")
    }
  end

  describe "新入库单" do
    before { visit new_data_form_path }
    it {
      fill_in("data_form[comment]", :with => "哈哈")
      click_button '提交'
      page.current_path.should == "/data_forms/1"
    }    
    it {
      click_button '提交'
      page.should have_content("个错误")
    }
  end

  describe "新出库单" do
    before { visit new_data_form_path }
    it {
      fill_in("data_form[comment]", :with => "哈哈")
      click_button '提交'
      page.current_path.should == "/data_forms/1"
    }    
    it {
      click_button '提交'
      page.should have_content("个错误")
    }
  end

end
