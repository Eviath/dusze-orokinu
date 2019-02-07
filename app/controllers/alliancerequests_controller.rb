class AlliancerequestsController < ApplicationController
  before_action :load_alliancerequest,  only: :destroy
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :admin_or_author, only: :destroy
  before_action :admin_user,   only: [:show, :index]

  def index

    @alliancerequestsapproved = Alliancerequest.approved.newest.page(params[:page]).per_page(5)
    @alliancerequestspending = Alliancerequest.pending.newest.page(params[:page]).per_page(5)
    @alliancerequestsdeclined = Alliancerequest.declined.newest.page(params[:page]).per_page(5)
  end

  def podanie

    @user = current_user
    @alliancerequest = @user.alliancerequest

  end


  def approve
    @alliancerequest = Alliancerequest.find(params[:id])
    user = @user
    auser = @alliancerequest.user
    auser.add_role :lider


    areq = @alliancerequest
    areq.update_attribute(:approval, true)

    flash[:success] = "Podanie zostało zaakceptowane, autor podania otrzymał rangę lidera klanu."
    redirect_to alliancerequests_path
  end

  def decline
    @alliancerequest = Alliancerequest.find(params[:id])

    areq = @alliancerequest
    areq.update_attribute(:approval, false)

    flash[:success] = "Podanie zostało odrzucone."
    redirect_to alliancerequests_path

  end

  def pend
    @alliancerequest = Alliancerequest.find(params[:id])
    user = @user
    auser = @alliancerequest.user
    auser.remove_role :lider


    areq = @alliancerequest
    areq.update_attribute(:approval, nil)

    flash[:success] = "Podanie zostało przeniesione do oczekujących."
    redirect_to alliancerequests_path

  end

  def new

    @user = current_user
    @alliancerequest = current_user.build_alliancerequest if user_signed_in?
    @alliancerequest = @user.alliancerequest
  end

  def show
    @user = User.find(params[:id] )
    @alliancerequest = Alliancerequest.find(params[:id])

  end


  def create
    @alliancerequest = current_user.build_alliancerequest(alliancerequest_params)
    if @alliancerequest.save
      flash[:success] = "Podanie do sojuszu zostało zapisane!"
      redirect_to request_path
    else
      render 'alliancerequests/new'
    end
  end

  def destroy
    @alliancerequest.destroy
    flash[:success] = "Podanie do sojuszu usunięte."
    redirect_to alliancerequests_path || request.referrer
  end

  private

  def alliancerequest_params
    params.require(:alliancerequest).permit(:nickname, :clan_about, :lider_nickname, :clan_name, :clan_tier, :clan_members, :discord_check, :rules_check, :approval)
  end

  def load_alliancerequest
    # renders 404 on production if not found
    @alliancerequest = Alliancerequest.find(params[:id])
  end

  def admin_or_author
    redirect_to(root_url) unless administrator? || authorship?
  end

  def administrator?
    current_user.has_role? :admin
  end

  def authorship?
    @alliancerequest.user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.has_role? :admin
  end

end
