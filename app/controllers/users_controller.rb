class UsersController < ApplicationController

    before_action :authenticate_user!


    def index
      @users = User.all.paginate(page: params[:page], per_page: 10)
    end

    def show
      @user = User.find(params[:id] )
      redirect_to root_url and return unless true
      @alliancerequest = @user.alliancerequest
    end

    def approve
        user = User.find(params[:id])
        # old wat
        # user.update_attribute(:lider, true)

        # new way
        user.add_role :lider
        flash[:success] = "Użytkownik otrzymał rangę Lidera klanu."
        redirect_to request.referrer
    end

    def decline
        user = User.find(params[:id])

        # old way
        # user.update_attribute(:lider, false)

        # new way
        user.remove_role :lider

        flash[:success] = "Użytkownik został pozbawiony rangi Lidera klanu."
        redirect_to request.referrer
    end

  private




end



