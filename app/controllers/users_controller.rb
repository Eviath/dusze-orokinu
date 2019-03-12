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
      @news_comments = @user.news_comments
    end

    def update_role
        user = User.find(params[:id])

          all_roles = Role.all
        

          if !params[:user].nil?
            params[:user][:input_roles].each do |role|
              user.add_role role unless user.has_role? role
            end
          else
            roles = user.roles.pluck(:name)
            roles.each do |role|
              user.remove_role role
            end
          end


        flash[:success] = "Rangi użytkownika zaktualizowane."
        redirect_to request.referrer || requests_path
    end


  private




end



