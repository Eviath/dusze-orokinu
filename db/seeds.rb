# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
#
# User.create!(name:  "evid",
#              email: "evid@evid.com",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              )
#
#
# user = User.find(1)
# user.add_role :admin


# # news seed
# 15.times do |n|
#   title  = Faker::Lorem.sentence(5)
#   content = Faker::Lorem.paragraphs(3)
#   News.create!(title:  title,
#                content: content,
#                user_id:              1,
#                created_at: Time.zone.now)
# end

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


# Principles
# umowa miedzyklanowa

Principle.create!(title: 'Umowa międzyklanowa',
                    created_at: Time.zone.now)

# regulamin klanowy
Principle.create!(title: 'Regulamin czatu',
                    created_at: Time.zone.now)


# Rules Category
RuleCategory.create!(name: 'Regulamin',
                    created_at: Time.zone.now)

RuleCategory.create!(name: 'Moderatorzy',
                     description: 'Za utrzymanie porządku na czacie sojuszu odpowiedzialni są Opiekunowie sojuszu oraz osoby
                                   wyznaczone przez liderów klanów zaufanych. !UWAGA!** Ważnym czynnikiem w moderacji czatu odgrywają liderzy klanów.
                                   Do utrzymania porządku na czacie sojuszu zobowiązani są Liderzy oraz radni klanów należących do sojuszu.
                                   Problematyczni członkowie sojuszu ignorujący moderację kierowani będą do zarządu klanu do którego należą.
                                   - Liderzy klanów dołączając do sojuszu akceptują regulamin międzyklanowy który zobowiązuje do utrzymania porządku na
                                   czacie sojuszu i egzekwowania kar na osobach nie przestrzegających regulaminu.',
                     created_at: Time.zone.now)

RuleCategory.create!(name: 'Handel',
                     description: 'Handel na czacie sojuszu jest dozwolony. (W granicach zdrowego rozsądku)',
                      created_at: Time.zone.now)


RuleCategory.create!(name: 'Zasady',
                     description: 'Na czacie zabronione jest:',
                     created_at: Time.zone.now)

RuleCategory.create!(name: 'Kary',
                     description: 'Za łamanie zasad zawartych w niniejszym regulaminie Moderatorzy oraz Opiekunowie sojuszu zgodnie z zasadami wspomnianymi
                     w "Zasady stosowania kar" uprawnieni są do egzekwowania kar na czacie sojuszu. Brak współpracy przywódctwa klanu z moderatorami/opiekunami
                     sojuszu w sprawie podjęcia odpowiednich działań względem osób łamiących regulamin skutkować może wyrzuceniem danego klanu z sojuszu.
                     Recydywa: Recydywa jest to powtarzające się łamanie regulaminu czatu, zostaje traktowane jako ignorowanie moderacji i podlega najwyższej karze.
                     Kary nakładane są zgodnie z wielkością przewinienia. Wszelkie nadużycia mogą zostać zgłoszone prywatnie do administracji.',
                     created_at: Time.zone.now)


RuleCategory.create!(name: 'Zasady stosowania kar:',
                     description: 'Egzekwowanie kar przez Moderację podlega zasadom opisanym poniżej:',
                     created_at: Time.zone.now)




# RULES

Rule.create!(content:  'Wszystkie klany są równe, tj. żaden klan nie może narzucać innym swoich zasad.',
             principle_id: 1,
              created_at: Time.zone.now)

Rule.create!(content:  'Opiekę nad sojuszem sprawuje Opiekun, Starszyzna (wybierana przez Opiekuna) i Rada Klanowa
                       (tj. zebranie Radnych wystawionych przez klany) a ich decyzję wykonuje Leader klanu opiekującego się sojuszem (Sneaky Victors).',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Każdy Leader zobowiązany jest do wystawienia Radnych ze swojego klanu (minimum jednego). Sam Leader zaś nie ma obowiązku utrzymania statusu Radnego.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Radni i Leader powinni reprezentować jedno zdanie jako klan podczas wprowadzania zmian.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Skład Radnych jest ustalany przez Leadera klanu.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Sojusz wymaga od klanów zachowania przyjaznej atmosfery.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Problematyczne osoby będą karane zawieszeniem komunikacji aż do odniesienia skutku.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Spory międzyklanowe będą rozwiązywane drogą dyplomatyczną.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Od wszystkich graczy w sojuszu wymaga się ujednolicenia komunikacji - Discord w sojuszu jest obowiązkowy.
                        (NIE zabraniamy klanom utrzymania własnych sposobów komunikacji. NIE wymagamy uczestnictwa głosowego,
                        wymagamy bycie online na discordzie podczas gry w Warframe.)',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Klany będące w sojuszu zobowiązują się do rekrutacji jedynie osób powyżej 16 roku życia. Wyjątkiem są osoby ogarnięte lub znajome.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Liderzy oraz radni odpowiadają za graczy należących do ich klanów.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Zakazuje się rozprzestrzeniania treści nielegalnych za pomocą kanałów sojuszowych.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Rejestracja do klanów na Discordzie przeprowadzana jest przez Liderów/Rekruterów/Administrację sojuszu.
                        W czasie rejestracji na discordzie wymagana jest obecność na grze Warframe.',
             principle_id: 1,
             created_at: Time.zone.now)

Rule.create!(content:  'Klany o długim stażu i dobrej opinii mają szansę uzyskania rangi Zaufanego Klanu. Jedyny przywilej otrzymywany
                        w ramach rangi jest możliwością rekrutacji nowych klanów do sojuszu. Ranga udzielana jest po uzyskaniu większości
                        pozytywnych głosów Leaderów Zaufanych Klanów i nie jest ona wyróżniona.',
             principle_id: 1,
             created_at: Time.zone.now)


Rule.create!(content:  'Klany, które utraciły członkostwo w sojuszu, mogą się ponownie o nie ubiegać. Podanie w takiej sytuacji rozpatruje Rada w ciągu 24h.',
             principle_id: 1,
             created_at: Time.zone.now)





# czat rules


# category 1
Rule.create!(content:  'Wszystkie osoby na czacie są równe, regulamin obowiązuje każdą osobę należącą do sojuszu bez względu na rangę.',
             rule_category_id: 1,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Nieznajomość regulaminu nie zwalnia z obowiązku jego przestrzegania.',
             rule_category_id: 1,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Administracja zastrzega sobie prawo do zmiany regulaminu. (Osoby należące do sojuszu zostaną powiadomione o wszelkich zmianach.)',
             rule_category_id: 1,
             principle_id: 2,
             created_at: Time.zone.now)


#  category 2
Rule.create!(content:  'Moderatorzy posiadają uprawnienia do moderacji czatu oraz egzekwowania kar.',
             rule_category_id: 2,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Moderatorzy zobowiązani są do umieszczenia informacji o podjętych działaniach w miejscu do tego przeznaczonym.',
             rule_category_id: 2,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Moderatorzy nie mają obowiązku udzielania informacji na temat podjętych działań osobom postronnym.',
             rule_category_id: 2,
             principle_id: 2,
             created_at: Time.zone.now)


# category 3
Rule.create!(content:  'Zabronione jest spamowanie ofertami kupna/sprzedaży/wymiany na czacie sojuszu.',
             rule_category_id: 3,
             principle_id: 2,
             created_at: Time.zone.now)


#  category 4
Rule.create!(content:  'Spamowanie, floodowanie, trollowanie.',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Pisanie WIELKIMI literami oraz nadużywania znaków interpunkcyjnych (w szczególności "?;!;.") etc.',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Celowe wprowadzanie w błąd innych graczy (złośliwe podawanie nieprawdziwych informacji)',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Wszczynanie kłótni, prowokacje, podteksty mające w szczególności na celu poniżenie, ubliżenie, oczernienie.',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Dyskutowanie na czacie z Moderatorami na temat przyznanych kar, regulaminu i podważanie decyzji.',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Pisanie łamaną polszczyzną bądź zawierającą dużą ilość błędów ortograficznych (Nałożona może zostać minimalna kara regulaminowa tj. ostrzeżenie.)',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Zakaz wyłudzania informacji osobistych, haseł/loginów/e-maili.',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Zakaz rekrutacji osób do klanów na czacie sojuszu. (Osoba, która dobrowolnie postanowi opuścić klan na rzecz innego klanu z sojuszu powinna uprzedzić lidera/radnych klanu, w którym się znajduje o zaistniałej sytuacji.)',
             rule_category_id: 4,
             principle_id: 2,
             created_at: Time.zone.now)


# category 5
Rule.create!(content:  'Ostrzeżenie - Może mieć formę uwagi na czacie ogólnym i/lub na prywatnym lub formalne ostrzeżenie które zostanie zapisane w miejscu do tego przeznaczonym.',
             rule_category_id: 5,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Kick - Wyrzucenie osoby z czatu sojuszu.',
             rule_category_id: 5,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Ban 1H - Ban na czat sojuszu, który zostaje automatycznie zdjęty po upłynięciu 1 godziny.',
             rule_category_id: 5,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Ban 24H - Ban na czat sojuszu, który zostaje automatycznie zdjęty po upłynięciu 24 godzin.',
             rule_category_id: 5,
             principle_id: 2,
             created_at: Time.zone.now)


# category 6
Rule.create!(content:  'Każdy Kick/Ban oraz formalne ostrzeżenia muszą zostać zgłoszone w miejscu do tego przeznaczonym.',
             rule_category_id: 6,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Decyzja o wymiarze kary należy do moderacji - Moderator zobowiązuje się do suwerennego wyznaczania kar.',
             rule_category_id: 6,
             principle_id: 2,
             created_at: Time.zone.now)

Rule.create!(content:  'Wszelkie nadużycia moderacji powinny byc zgłaszane do Opiekunów sojuszu.',
             rule_category_id: 6,
             principle_id: 2,
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
#     users.each { |user| user.create_request(nickname: nickname, lider_nickname: lider_nickname, clan_name: clan_name, clan_tier: clan_tier, clan_about: clan_about, clan_members: clan_members, discord_check: discord_check, rules_check: rules_check, approval: nil ) }
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
