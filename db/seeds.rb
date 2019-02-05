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


# news seed
15.times do |n|
  title  = Faker::Lorem.sentence(5)
  content = Faker::Lorem.paragraphs(3)
  News.create!(title:  title,
               content: content,
               user_id:              1,
               created_at: Time.zone.now)
end

main_about = 'MAIN'
column_two = 'COLUMN_TWO'
column_one = 'COLUMN_ONE'




# abouts seed


#
# main assignment
#

About.create!(title:  'Dusze Orokinu',
              assignment: main_about,
              description: 'Polski sojusz Warframe 2019',
              content: 'Naszym celem jest zjednoczenie Polskich klanów, zachęcenie do wspólnej gry i zachowania miłej atmosfery.
                        Ideą naszego sojuszu jest stworzenie dobrze rozumiejącej się grupy ogarniętych ludzi, aby to osiągnąć każdy
                        klan musi spełniać wymagania sojuszu takie jak minimalny wiek w klanach oraz obowiązkowy discord. Przyszłość
                        naszego sojuszu tworzą klany, chcąc zadbać o przyszłość sojuszu musimy dbać o siebie nawzajem.',
              created_at: Time.zone.now)



#
# column_two assignment
#



About.create!(title:  'Zrzeszamy Polskie klany gry Warframe',
              assignment: column_one,
              description: 'Rozwijaj swój klan',
              content: 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym.
                        Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.
                        Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym.',
              created_at: Time.zone.now)




About.create!(title:  'Budujemy przyszłość',
              assignment: column_one,
              description: 'Rozwijaj swój klan',
              content: 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym.
                        Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.
                        Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym.',
              created_at: Time.zone.now)




About.create!(title:  'Stwarzamy możliwości',
              assignment: column_one,
              description: 'Poznaj nowe ścieżki',
              content: 'Naszym celem jest zjednoczenie Polskich klanów, zachęcenie do wspólnej gry i zachowania miłej atmosfery.
                        Ideą naszego sojuszu jest stworzenie dobrze rozumiejącej się grupy ogarniętych ludzi, aby to osiągnąć każdy
                        klan musi spełniać wymagania sojuszu takie jak minimalny wiek w klanach oraz obowiązkowy discord. Przyszłość naszego
                        sojuszu tworzą klany, chcąc zadbać o przyszłość sojuszu musimy dbać o siebie nawzajem.',
              created_at: Time.zone.now)












#
# column_one assignment
#

About.create!(title:  'Świetna Atmosfera',
              assignment: column_two,
              content: 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym.
                        Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.
                        Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym.',
              created_at: Time.zone.now)




About.create!(title:  'Komunikacja',
              assignment: column_two,
              content: 'Discord w naszym sojuszu jest obowiązkowy, nie zmuszamy do uczestniczenia głosowego, wymagamy
                        bycia online na Discordzie podczas gry. Aspektem dobrego sojuszu jest komunikacja, fajnie jest
                        sobie popisać w wolnym czasie ze znajomymi ale gdy gra się jakieś misje lub rajdy, najważniejsze jest
                        zgranie i nie ma czasu na pisanie na czacie.',
              created_at: Time.zone.now)




About.create!(title:  'Rekrutacja',
              assignment: column_two,
              content: 'Zanim postanowisz dołączyć do sojuszu, przeczytaj dokładnie regulamin międzyklanowy oraz czatu,
                        zapoznaj się również z naszymi wymaganiami, wszystko co musisz wiedzieć zanim do nas dołączysz znajdziesz
                        na tej stronie! :) Oferujemy również miejsce na reklamę dla klanów należących do sojuszu!',
              created_at: Time.zone.now)


# RULES

Rule.create!(content:  'Wszystkie klany są równe, tj. żaden klan nie może narzucać innym swoich zasad.',
              created_at: Time.zone.now)

Rule.create!(content:  'Opiekę nad sojuszem sprawuje Opiekun, Starszyzna (wybierana przez Opiekuna) i Rada Klanowa
                       (tj. zebranie Radnych wystawionych przez klany) a ich decyzję wykonuje Leader klanu opiekującego się sojuszem (Sneaky Victors).',
             created_at: Time.zone.now)

Rule.create!(content:  'Każdy Leader zobowiązany jest do wystawienia Radnych ze swojego klanu (minimum jednego). Sam Leader zaś nie ma obowiązku utrzymania statusu Radnego.',
             created_at: Time.zone.now)

Rule.create!(content:  'Radni i Leader powinni reprezentować jedno zdanie jako klan podczas wprowadzania zmian.',
             created_at: Time.zone.now)

Rule.create!(content:  'Skład Radnych jest ustalany przez Leadera klanu.',
             created_at: Time.zone.now)

Rule.create!(content:  'Sojusz wymaga od klanów zachowania przyjaznej atmosfery.',
             created_at: Time.zone.now)

Rule.create!(content:  'Problematyczne osoby będą karane zawieszeniem komunikacji aż do odniesienia skutku.',
             created_at: Time.zone.now)

Rule.create!(content:  'Spory międzyklanowe będą rozwiązywane drogą dyplomatyczną.',
             created_at: Time.zone.now)

Rule.create!(content:  'Od wszystkich graczy w sojuszu wymaga się ujednolicenia komunikacji - Discord w sojuszu jest obowiązkowy.
                        (NIE zabraniamy klanom utrzymania własnych sposobów komunikacji. NIE wymagamy uczestnictwa głosowego,
                        wymagamy bycie online na discordzie podczas gry w Warframe.)',
             created_at: Time.zone.now)

Rule.create!(content:  'Klany będące w sojuszu zobowiązują się do rekrutacji jedynie osób powyżej 16 roku życia. Wyjątkiem są osoby ogarnięte lub znajome.',
             created_at: Time.zone.now)

Rule.create!(content:  'Liderzy oraz radni odpowiadają za graczy należących do ich klanów.',
             created_at: Time.zone.now)

Rule.create!(content:  'Zakazuje się rozprzestrzeniania treści nielegalnych za pomocą kanałów sojuszowych.',
             created_at: Time.zone.now)

Rule.create!(content:  'Rejestracja do klanów na Discordzie przeprowadzana jest przez Liderów/Rekruterów/Administrację sojuszu.
                        W czasie rejestracji na discordzie wymagana jest obecność na grze Warframe.',
             created_at: Time.zone.now)

Rule.create!(content:  'Klany o długim stażu i dobrej opinii mają szansę uzyskania rangi Zaufanego Klanu. Jedyny przywilej otrzymywany
                        w ramach rangi jest możliwością rekrutacji nowych klanów do sojuszu. Ranga udzielana jest po uzyskaniu większości
                        pozytywnych głosów Leaderów Zaufanych Klanów i nie jest ona wyróżniona.',
             created_at: Time.zone.now)


Rule.create!(content:  'Klany, które utraciły członkostwo w sojuszu, mogą się ponownie o nie ubiegać. Podanie w takiej sytuacji rozpatruje Rada w ciągu 24h.',
             created_at: Time.zone.now)




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
