# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
age_level_1 = AgeLevel.create(name: "Daisy")
age_level_2 = AgeLevel.create(name: "Brownie")
age_level_3 = AgeLevel.create(name: "Junior")
age_level_4 = AgeLevel.create(name: "Cadette")
age_level_5 = AgeLevel.create(name: "Senior")
age_level_6 = AgeLevel.create(name: "Ambassador")
age_level_7 = AgeLevel.create(name: "All Ages")