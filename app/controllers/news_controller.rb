class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:index, :show]
  # get all users with notification on
  before_action :get_users_with_notification_on, only: :create

  include Comment::Commen

  # GET /news
  # GET /news.json
  def index
    @news = News.includes(:user, :thumbnail_blob).all.newest.paginate(page: params[:page], per_page: 10)
    @news_category = NewsCategory.find(params[:id]) if params[:id].present?
    @news_with_category = News.includes(:user, :thumbnail_blob).where(news_category_id: params[:id]).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
      format.js
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])
    @similar_news = News.includes(:user, :thumbnail_blob).where(news_category_id: @news.news_category_id).order('created_at DESC').paginate(page: params[:page], per_page: 4)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
      format.js
    end
  end

  # GET /news/new
  def new
    @news = News.new

    # news category
    @categories = NewsCategory.all.map{|c| [ c.name, c.id ] }
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = current_user.news.build(news_params)
    @news.news_category_id = params[:news_category_id]
    respond_to do |format|
      if @news.save
        if !@users_with_notification_on.empty?
          NewsMailer.with(news: @news, users: @users_with_notification_on).notify_about_created_news.deliver_now
        end
        format.html { redirect_to @news, notice: 'News został zapisany.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    @news.news_category_id = params[:news_category_id]
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News został zaktualizowany.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News został usunięty.' }
      format.json { head :no_content }
    end
  end

  private

  def get_users_with_notification_on
    @users_notify_setting_true = User.with_settings_for(:notification).includes(:news)
    arr = []
    @users_notify_setting_true.each do |user|
      if user.settings(:notification).news == true
        arr << user.email
      end
    end
    @users_with_notification_on = arr
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :content, :thumbnail, :last_edit_desc)
    end
end
