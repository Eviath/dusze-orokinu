class ErrorsController < ApplicationController

  def show
    status_code = params[:code] || 500
    render :show, status: status_code
  end

end
