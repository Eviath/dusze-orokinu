class AlliancerequestsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


  def create
  @alliancerequest = current_user.build_alliancerequest(alliancerequest_params)
  if @alliancerequest.save
    flash[:success] = "Podanie do sojuszu zostało zapisane!"
    redirect_to clans_dashboard_path
  else
    render 'clans/new'
  end
end

def destroy
  @alliancerequest.destroy
  flash[:success] = "Podanie do sojuszu usunięte."
  redirect_to request.referrer || root_url
end

private

  def alliancerequest_params
    params.require(:alliancerequest).permit(:nickname, :clan_about, :lider_nickname, :clan_name, :clan_tier, :clan_members)
  end

  def correct_user
     @alliancerequest = current_user.alliancerequest
     redirect_to root_url if @alliancerequest.nil?
   end

end
