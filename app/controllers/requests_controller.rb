class RequestsController < ApplicationController
  before_action :load_request,  only: :destroy
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :admin_or_author, only: :destroy
  before_action :admin_user,   only: [:show, :index]
  load_and_authorize_resource

  def index
    @scope_name = if %w(all approved pending declined).include?(params[:scope_name]) # taking care that proper
                    params[:scope_name]
                  else
                    "all"
                  end
    @requests = Request.includes(:user).send(@scope_name.to_sym).decorate
    respond_to do |format|
      format.html
      format.js
    end
  end

  def podanie

    @user = current_user
    @request = @user.request.decorate

  end


  def approve
    @request = Request.find(params[:id])
    user = @user
    auser = @request.user
    auser.add_role :lider


    areq = @request
    areq.update_attribute(:approval, true)
    RequestMailer.with(user: auser).accepted_request.deliver_now
    flash[:success] = "Podanie zostało zaakceptowane, autor podania został poinformowany o akceptacji podania wiadomością e-mail oraz otrzymał rangę lidera klanu."
    redirect_to requests_path
  end

  def decline
    auser = @request.user
    @request = Request.find(params[:id])

    areq = @request
    areq.update_attribute(:approval, false)
    RequestMailer.with(user: auser).declined_request.deliver_now
    flash[:success] = "Podanie zostało odrzucone. Autor podania został o tym poinformowany wiadomością e-mail. Jeśli użytkownik miał rangę lidera, został jej pozbawiony."
    redirect_to requests_path

  end

  def pend
    @request = Request.find(params[:id])
    user = @user
    auser = @request.user
    auser.remove_role :lider


    areq = @request
    areq.update_attribute(:approval, nil)

    flash[:success] = "Podanie zostało przeniesione do oczekujących. Jeśli użytkownik miał rangę lidera, został jej pozbawiony."
    redirect_to requests_path

  end

  def new

    @user = current_user
    @request = current_user.build_request if user_signed_in?
    @request = @user.request

  end

  def show
    @request = Request.find(params[:id]).decorate
  end


  def create
    @request = current_user.build_request(request_params)
    if @request.save
      flash[:success] = "Podanie do sojuszu zostało zapisane! Otrzymasz powiadomienie e-mail jak tylko administracja sojuszu je rozpatrzy."
      RequestMailer.with(request: @request).created_request.deliver_now
      redirect_to '/podanie'
    else
      render :new
    end
  end

  def destroy
    @request.destroy
    flash[:success] = "Podanie do sojuszu usunięte."
    redirect_to '/podanie'
  end

  private

  def request_params
    params.require(:request).permit(:nickname, :clan_about, :lider_nickname, :clan_name, :clan_tier, :clan_members, :discord_check, :rules_check, :approval)
  end

  def load_request
    # renders 404 on production if not found
    @request = Request.find(params[:id])
  end

  def admin_or_author
    redirect_to(root_url) unless administrator? || authorship?
  end

  def administrator?
    current_user.has_role? :admin
  end

  def authorship?
    @request.user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.has_role? :admin
  end

end
