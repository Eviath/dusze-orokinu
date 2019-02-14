class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @commentable = News.find(params[:news_id])
    @comment = @commentable.comments.new(:parent_id => params[:parent_id])

  end

  def create
    @commentable = News.find(params[:news_id])
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to news_url(@commentable) }
      else
        format.html  {
          redirect_to news_url(@commentable)
          flash[:success] = 'Comment must be less than 140 characters'
        }
      end
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

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :user_id, :parent_id)
  end

end