class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:show]
    load_and_authorize_resource :except => [:index, :show]

    def index
      user = User.with_attached_avatar.includes(:clan)
      @users = user.without_role(:admin).without_role(:lider).without_role(:moderator).order(created_at: :ASC).paginate(page: params[:page], per_page: 10)
      @admins = user.with_role(:admin)
      @liderzy = user.with_role(:lider).order(created_at: :ASC).paginate(page: params[:page], per_page: 10)
      @moderators = user.with_role(:moderator)
    end

    def show
      @user = User.find(params[:id])
      redirect_to root_url and return unless true
      @request = @user.request
      @news_comments = @user.news_comments
    end

    def approve
        user = User.find(params[:id])
        # old wat
        # user.update_attribute(:lider, true)

        # new way
        user.add_role :lider
        flash[:success] = "Użytkownik otrzymał rangę Lidera klanu."
        redirect_to request.referrer || requests_path
    end

    def decline
        user = User.find(params[:id])

        # old way
        # user.update_attribute(:lider, false)

        # new way
        user.remove_role :lider

        flash[:success] = "Użytkownik został pozbawiony rangi Lidera klanu."
        redirect_to request.referrer || requests_path
    end

  private




end



