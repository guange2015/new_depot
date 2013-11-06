#coding=utf-8

FactoryGirl.define do

  factory :firework do
    name "大礼花"
    spec 20
    lastdata 0
  end

  factory :category do
    name "小产品类"
    code "0"
    level 0
  end

end
