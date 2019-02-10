# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview


  def accepted_request
    user = User.find(1)
    RequestMailer.with(user: user).accepted_request
  end

  def declined_request
    user = User.find(1)
    RequestMailer.with(user:user).accepted_request
  end



end
