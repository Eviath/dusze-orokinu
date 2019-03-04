class NewsMailerPreview < ActionMailer::Preview

  def notify_about_created_news
    user = User.find(1)
    @news = News.find(1)
    NewsMailer.with(user: user, news: @news).notify_about_created_news
  end

end
