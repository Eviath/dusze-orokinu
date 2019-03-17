class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @top_commenters = top_commenters_by_comments
    @top_liked_comments = top_liked_comments
    @top_liked_commenters = top_commenters_by_likes
  end

  def new
    @commentable = News.find(params[:news_id])
    @comment = @commentable.comments.new(:parent_id => params[:parent_id])
  end

  def create
    @commentable = News.find(params[:news_id])
    @comment = @commentable.comment.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to news_url(@commentable) }
      else
        format.html  {
          redirect_to news_url(@commentable)
          flash[:success] = 'Komentarz nie może zawierać więcej niż 140 znaków'
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


  def top_liked_comments
     Comment
            .preload(:likes)
            .joins(:likes)
            .group('comments.id')
            .order(Arel.sql('count(likes.id) desc'))
            .limit(10)
  end

  def top_commenters_by_likes
    User
        .preload(:likes)
        .joins(:likes)
        .group('users.id')
        .limit(10)
  end

  def top_commenters_by_comments
    User.preload(:comments).joins(:comments).group('users.id').where('comments.created_at >= ?', 1.week.ago.utc).order(Arel.sql('count(comments.id) desc')).limit(10)
  end


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