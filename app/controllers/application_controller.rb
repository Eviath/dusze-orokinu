class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  helper_method :mailbox


  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end


  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end
  
  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_url, :alert => exception.message }
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end


end
