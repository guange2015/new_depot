# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Firework.delete_all
DataForm.delete_all
DataList.delete_all
Category.delete_all

Category.create(name: '小产品类', code: '01', level: 0)
Category.create(name: '鞭炮', code: '02', level: 0)
Category.create(name: '礼花', code: '03', level: 0)
Category.create(name: '喷花', code: '04', level: 0)


