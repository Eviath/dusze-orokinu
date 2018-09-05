class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Zaloguj się aby mieć dostęp do tej części strony."
        redirect_to login_url
      end
    end


end
