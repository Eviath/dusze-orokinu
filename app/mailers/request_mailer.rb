class RequestMailer < ApplicationMailer

  default from: 'duszkiwarframe@gmail.com'

  def accepted_request
    @user = params[:user]
    @url  = 'https://dusze-orokinu.pl/request'
    mail(to: @user.email, subject: 'Dusze Orokinu - Podanie zostało zaakceptowane.')
  end

  def declined_request
    @user = params[:user]
    @url  = 'https://dusze-orokinu.pl/request'
    mail(to: @user.email, subject: 'Dusze Orokinu - Podanie zostało odrzucone.')
  end

  def created_request
    @gatheradmins = User.with_role(:admin)
    @admins = @gatheradmins.collect(&:email).join(',')
    @request = params[:request]
    @url  = 'https://dusze-orokinu.pl/requests'
    mail(to: @admins, subject: 'Dusze Orokinu - Pojawiło się nowe podanie do sojuszu klanu ')
  end

end
