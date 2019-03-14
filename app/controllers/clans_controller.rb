class ClansController < ApplicationController
  before_action :authenticate_user!, only: [:update, :panel, :create, :new, :destroy]
  before_action :load_clan,  only: [:edit, :update, :destroy]
  before_action :admin_or_author, only: [:edit, :update, :destroy]
  load_and_authorize_resource :except => [:index, :show]

  def index
    @clansapproved = Clan.with_attached_picture.approved.order('updated_at DESC').decorate
    @clanspending = Clan.with_attached_picture.pending.newest.decorate
    @clansdeclined = Clan.with_attached_picture.declined.decorate
    @clans = Clan.with_attached_picture.all.decorate
  end

  def approve
    clan = Clan.find(params[:id])
    clan.approval = !clan.approval # flop the status
    clan.save
    flash[:success] = "Ogłoszenie klanu zostało zaakceptowane"
    redirect_to clan_path(clan)
  end

def decline
  clan = Clan.find(params[:id])
  clan.approval = !clan.approval # flop the status
  clan.save
  flash[:success] = "Ogłoszenie klanu zostało odrzucone."

  redirect_to clan_path(clan)
end


  def show
    @clansapproved = Clan.approved.newest.page(params[:page]).per_page(5)
    @clan = Clan.find(params[:id]).decorate
  end

  def panel
    @user  = current_user
    @clan = @user.clan.decorate if @user.clan.present?
    @request = @user.request.decorate if @user.request.present?
  end

  def new
    @user = current_user
    @clan = current_user.build_clan if user_signed_in?
    @clan = @user.clan
  end

  def create
    @clan = current_user.build_clan(clan_params)
  if @clan.save
    flash[:success] = "Ogłoszenie klanu zostało zapisane! Stworzone po raz pierwszy, musi zostać rozpatrzone przez administrację sojuszu."
    # RequestMailer.with(clan: @clan).new_clan.deliver_now
    redirect_to pclan_path
  else
    render 'clans/new'
  end
  end

  def destroy
    @clan.destroy
    flash[:success] = "Ogłoszenie klanu zostało usunięte."
    redirect_to pclan_path || request.referrer
  end


  def edit
    @clan = Clan.find(params[:id])
  end

  def update
    @clan = Clan.find(params[:id])
    if @clan.update_attributes(clan_params)
      flash[:success] = "Ogłoszenie klanu zaktualizowane!"
      redirect_to pclan_path
    else
      render 'edit'
    end
  end


  private



def clan_params
params.require(:clan).permit(:name, :about, :leader, :tier, :members, :picture, :discord, :website, :approval, :recruitment_status)
end

def load_clan
  # renders 404 on production if not found
  @clan = Clan.find(params[:id])
end

def allowed?
administrator? || authorship?
end

def admin_or_author
  redirect_to(root_url) unless administrator? || authorship?
end

def administrator?
  user_signed_in? && current_user.has_role?(:admin)
end

def authorship?
  @clan.user == current_user
end

def admin_user
  redirect_to(root_url) unless current_user.has_role? :admin
end


end
