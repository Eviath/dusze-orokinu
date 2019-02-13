class CommentsController < ApplicationController
  before_action :load_commentable
  before_action :authenticate_user!

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: "Komentarz został zapisany."
    else
      render :new
    end
  end

  def destroy
    @news = News.find(params[:news_id])
    @comment = @news.comments.find(params[:id])
    if @comment.destroy
      redirect_to news_path(@news), notice: 'Komentarz został usunięty'
    end

  end
  private

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end