class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Konto nie zostało jeszcze aktywowane. "
        message += "Sprawdź swój e-mail aby aktywować konto."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Nieprawidłowa kombinacja hasła/e-mail.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
