class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:index, :show]

  include Comment::Commen

  # GET /news
  # GET /news.json
  def index
    @news = News.all.order(created_at: :desc)
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = current_user.news.build(news_params)
    if @news.save
      flash[:success] = "News został utworzony"
      redirect_to news_index_path
    else
      render root_path
    end
  end
  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
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
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :content, :thumbnail)
    end
end
