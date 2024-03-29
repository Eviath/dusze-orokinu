class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  helper_method :mailbox
  before_action :last_page


  def vitruvian
    cookies[:layout] = "vitruvian"
        redirect_to request.referrer || root_path

  end

  def application
    cookies[:layout] = "application"

        redirect_to request.referrer || root_path

  end


  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    elsif cookies[:layout] == "application"
      "application"
    elsif cookies[:layout] == "vitruvian"
      "vitruvian"
    else
      "application"
    end
  end

  private


  def last_page
    session[:last_page] = request.env['HTTP_REFERER']
  end

  def mailbox
    @mailbox ||= current_user.mailbox
  end


  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end
  
  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end


end
