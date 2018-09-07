class AlliancerequestsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :load_alliancerequest,  only: :destroy
  before_action :admin_or_author, only: :destroy
  before_action :admin_user,   only: [:show, :index]

  def index

       @alliancerequests = Alliancerequest.all

  end

  def podanie
      @user = current_user
      @alliancerequest = @user.alliancerequest
  end


    def new

      @user = current_user
            @alliancerequest = current_user.build_alliancerequest if logged_in?
            @alliancerequest = @user.alliancerequest
       end

       def show
        @alliancerequest = Alliancerequest.find(params[:id])
       end


  def create
  @alliancerequest = current_user.build_alliancerequest(alliancerequest_params)
  if @alliancerequest.save
    flash[:success] = "Podanie do sojuszu zostało zapisane!"
    redirect_to podanie_path
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
    params.require(:alliancerequest).permit(:nickname, :clan_about, :lider_nickname, :clan_name, :clan_tier, :clan_members, :discord_check, :rules_check)
  end

  def load_alliancerequest
    # renders 404 on production if not found
    @alliancerequest = Alliancerequest.find(params[:id])
  end

  def admin_or_author
    redirect_to(root_url) unless administrator? || authorship?
  end

  def administrator?
    current_user.admin?
  end

  def authorship?
    @alliancerequest.user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
