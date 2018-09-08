class ClansController < ApplicationController

  before_action :logged_in_user, only: [:update, :panel, :create, :new, :destroy]
  before_action :load_clan,  only: [:edit, :update, :destroy]
  before_action :admin_or_author, only: [:edit, :update, :destroy]


  def index
    @clans = Clan.all
  end



  def show
    @clans = Clan.all
    @clan = Clan.find(params[:id])
  end

  def panel
    @user = current_user
    @clan = @user.clan
  end


  def new
    @user = current_user
    @clan = current_user.build_clan if logged_in?
    @clan = @user.clan
  end

  def create
    @clan = current_user.build_clan(clan_params)
  if @clan.save
    flash[:success] = "Ogłoszenie klanu zostało zapisane!"
    redirect_to podanie_path
  else
    render 'clans/new'
  end
  end

  def destroy
    @clan.destroy
    flash[:success] = "Ogłoszenie klanu zostało usunięte."
    redirect_to clans_path || request.referrer
  end


  def edit
    @clan = Clan.find(params[:id])
  end

  def update
    @clan = Clan.find(params[:id])
    if @clan.update_attributes(clan_params)
      flash[:success] = "Ogłoszenie klanu zaktualizowane!"
      redirect_to clans_path
    else
      render 'edit'
    end
  end


  private

def clan_params
params.require(:clan).permit(:name, :about, :leader, :logo, :tier, :members)
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
  current_user.admin?
end

def authorship?
  @clan.user == current_user
end

def admin_user
  redirect_to(root_url) unless current_user.admin?
end


end
