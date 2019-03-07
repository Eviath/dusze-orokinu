class NewsMailer < ApplicationMailer

  default from: 'duszkiwarframe@gmail.com'

  def notify_about_created_news
    @users = params[:users]
    @news = params[:news]
    mail(to: @users, subject: 'Dusze Orokinu - Nowa aktualność')
  end


end
