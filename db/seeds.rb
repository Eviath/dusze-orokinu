# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(name:  "Evid",
             email: "evid@rails.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

15.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@rails.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


  users = User.order(:created_at).take(5)
  1.times do
    clan_about = "Fajny klan."
    clan_members = 80
    clan_tier  = "Storm"
    clan_name = "Klan"
    lider_nickname  = Faker::Name.name
    nickname  = Faker::Name.name
    users.each { |user| user.create_alliancerequest(nickname: nickname, lider_nickname: lider_nickname, clan_name: clan_name, clan_tier: clan_tier, clan_about: clan_about, clan_members: clan_members ) }

  end
