class UsersController < ApplicationController

    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user,   only: [:edit, :update, :destroy]

    def index
  @users = User.where(activated: true).paginate(page: params[:page], per_page: 10)
end



    def show
    @user = User.find(params[:id] )
    redirect_to root_url and return unless true
    @alliancerequest = @user.alliancerequest
  end

  def approve
      user = User.find(params[:id])
      user.update_attribute(:lider, true)
      flash[:success] = "Użytkownik otrzymał rangę Lidera klanu."
      redirect_to request.referrer

end

def decline
    user = User.find(params[:id])
    user.update_attribute(:lider, false)
    flash[:success] = "Użytkownik został pozbawiony rangi Lidera klanu."
    redirect_to request.referrer

end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       @user.send_activation_email
      flash[:info] = "Sprawdź swój e-mail aby aktywować konto."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profil zaktualizowany!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  User.find(params[:id]).destroy
  flash[:success] = "Użytkownik usunięty."
  redirect_to users_url
end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :lider)
  end
  # Before filters


  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
   end

   def admin_user
     redirect_to(root_url) unless current_user.admin?
   end
end



