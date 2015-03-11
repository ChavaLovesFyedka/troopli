# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# OfficialBadgeParser.new

# badgeparser1 = Parser.new('./Patches1.csv')
# badgeparser1.badge_list

#Badges 

members = Member.create([  # MEMBER #
                         { email: "member@example.com",
                           password: "password",
                           password_confirmation: "password",
                           role: "member" },
                           # LEADER # 
                         { email: "leader@example.com",
                           password: "password",
                           password_confirmation: "password",
                           role: "leader" },
                           # ADMIN #
                         { email: "admin@example.com",
                           password: "password",
                           password_confirmation: "password",
                           role: "admin" }
                        ])
                        
troop = Troop.create(name: "Lilypads",
                     description: "We love to camp!",
                     age_level: 12,
                     leader_id: Member.find_by(email: "leader@example.com").id)

events = Event.create([
                       { name: "Party",
                         description: "At Red Lobster",
                         start_at: Time.now,
                         end_at: Time.now,
                         troop_id: Troop.first.id },
                       { name: "Camping",
                         description: "In the woods",
                         start_at: Time.now,
                         end_at: Time.now,
                         troop_id: Troop.first.id }
                      ])
