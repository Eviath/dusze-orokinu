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

end
