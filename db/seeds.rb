# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(name:  "evid",
             email: "evid@evid.com",
             password:              "foobar",
             password_confirmation: "foobar",
             )


user = User.find(1)
user.add_role :admin


15.times do |n|
  title  = Faker::Lorem.sentence(5)
  content = Faker::Lorem.paragraphs(3)
  News.create!(title:  title,
               content: content,
               user_id:              1,
               created_at: Time.zone.now)
end



#
#
# User.create!(name:  "test",
#              email: "test@rails.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              activated: true,
#              lider:     true,
#              activated_at: Time.zone.now)
#
#
# 15.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@rails.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end
#
#
#   users = User.order(:created_at).take(5)
#   1.times do
#     clan_about = "Fajny klan."
#     clan_members = 80
#     clan_tier  = "Storm"
#     clan_name = "Klan"
#     rules_check = "Tak"
#     discord_check = "Tak"
#     lider_nickname  = Faker::Name.name
#     nickname  = Faker::Name.name
#     users.each { |user| user.create_alliancerequest(nickname: nickname, lider_nickname: lider_nickname, clan_name: clan_name, clan_tier: clan_tier, clan_about: clan_about, clan_members: clan_members, discord_check: discord_check, rules_check: rules_check, approval: nil ) }
#
#   end
#
#   users = User.order(:created_at).take(2)
#   1.times do
#     about = "Fajny klan."
#     members = 80
#     website = "https://eviathos.pl"
#     discord = "https://discord.gg/uJEJAes"
#     tier  = "Storm"
#     picture = "LogoFake"
#     leader  = Faker::Name.name
#     name  = Faker::Name.name
#     users.each { |user| user.create_clan(name: name, leader: leader, about: about, tier: tier, members: members, picture: picture, website: website, discord: discord, approval: false) }
#
#   end
