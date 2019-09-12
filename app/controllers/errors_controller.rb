class ErrorsController < ApplicationController

  def show
    status_code = params[:code] || 500
    flash.alert = "Status #{status_code}"
    render :show, status: status_code
  end

end
