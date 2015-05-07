# BADGES

parser = Parser.new("Patches1.csv")
parser.badge_list

# Ideas

parser2 = Parser.new("Ideas2.csv")
parser2.idea_list

# ADMIN

Member.create(email: "admin@example.com", password: "password",
              password_confirmation: "password", role: "admin")

# LEADERS

leader1 = Member.create(email: "leader1@example.com", password: "password",
                        password_confirmation: "password", role: "leader")

# leader1 owns:

troop1 = Troop.create(name: Faker::Lorem.words(2).join(' '),
                      description: Faker::Lorem.sentence,
                      age_level: "Junior",
                      leader: leader1)

3.times do |counter|
  troop1.troop_badges.create(badge_id: counter)
end

10.times do
  troop1.events.create(name: Faker::Lorem.words(2).join(' '),
                       description: Faker::Lorem.sentence,
                       start_at: Faker::Time.forward(30, :morning),
                       end_at: Faker::Time.forward(30, :afternoon))
end

#

leader2 = Member.create(email: "leader2@example.com", password: "password",
                        password_confirmation: "password", role: "leader")

# leader2 owns

troop2 = Troop.create(name: Faker::Lorem.words(2).join(' '),
                      description: Faker::Lorem.sentence,
                      age_level: "Senior",
                      leader: leader2)

3.times do |counter|
  troop2.troop_badges.create(badge_id: (counter + 3))
end

10.times do 
  troop2.events.create(name: Faker::Lorem.words(2).join(' '),
                       description: Faker::Lorem.sentence,
                       start_at: Faker::Time.forward(30, :morning),
                       end_at: Faker::Time.forward(30, :afternoon))
end

# MEMBERS

10.times do |counter|
  Member.create(email: "member#{counter}@example.com", password: "password",
                password_confirmation: "password", role: "member")
end
