class NewsCategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:show]

  before_action
  before_action :set_news_category, only: [:show, :edit, :update, :destroy]

  # GET /news_categories
  # GET /news_categories.json
  def index
    @news_categories = NewsCategory.all
  end

  # GET /news_categories/1
  # GET /news_categories/1.json
  def show
    @news = News.where(news_category_id: @news_category.id)
  end

  # GET /news_categories/new
  def new
    @news_category = NewsCategory.new
  end

  # GET /news_categories/1/edit
  def edit
  end

  # POST /news_categories
  # POST /news_categories.json
  def create
    @news_category = NewsCategory.new(news_category_params)

    respond_to do |format|
      if @news_category.save
        format.html { redirect_to @news_category, notice: 'News category was successfully created.' }
        format.json { render :show, status: :created, location: @news_category }
      else
        format.html { render :new }
        format.json { render json: @news_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_categories/1
  # PATCH/PUT /news_categories/1.json
  def update
    respond_to do |format|
      if @news_category.update(news_category_params)
        format.html { redirect_to @news_category, notice: 'News category was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_category }
      else
        format.html { render :edit }
        format.json { render json: @news_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_categories/1
  # DELETE /news_categories/1.json
  def destroy
    @news_category.destroy
    respond_to do |format|
      format.html { redirect_to news_categories_url, notice: 'News category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_category
      @news_category = NewsCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_category_params
      params.require(:news_category).permit(:name, :desc)
    end
end
