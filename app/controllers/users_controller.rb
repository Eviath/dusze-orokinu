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
      @user = User.find(params[:id]).decorate
      redirect_to root_url and return unless true
      @request = @user.request
      @comments = @user.comments
    end

    def user_comments
      respond_to do |format|
        format.html {}
        format.js
      end
    end

    def user_profile
      @user = User.find(params[:id]).decorate
      respond_to do |format|
        format.html {}
        format.js
      end
    end
  private


end



