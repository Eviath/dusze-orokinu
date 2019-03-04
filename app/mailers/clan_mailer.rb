class ClanMailer < ApplicationMailer

  default from: 'duszkiwarframe@gmail.com'

  def new_clan
    gatheradmins = User.with_role(:admin)
    admins = gatheradmins.collect(&:email).join(',')
    @url  = 'https://dusze-orokinu.pl/klany'
    mail(to: admins, subject: 'Dusze Orokinu - Nowe ogłoszenie klanu')
  end

end
