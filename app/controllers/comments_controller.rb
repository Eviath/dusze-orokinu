class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # Users with highest comment count
    @highest_comment_count= highest_comment_count

    # Comments with highest likes count
    @most_liked_comments = most_liked_comments

    # Users which comments have the highest count of likes
    @users_with_most_liked_comments = users_with_most_liked_comments
  end

  def new
    @commentable = News.find(params[:news_id])
    @comment = @commentable.comments.new(:parent_id => params[:parent_id])
  end

  def create
    @commentable = News.find(params[:news_id])
    @comment = @commentable.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to news_url(@commentable) }
      else
        format.html  {
          redirect_to news_url(@commentable)
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

  # Users which comments have the highest count of likes
  def users_with_most_liked_comments
    User
        .preload(:likes)
        .joins(:likes)
        .group('users.id')
        .order(Arel.sql('count(likes.id) desc'))
        .limit(10)
  end

  #  Comments with highest likes count
  def most_liked_comments
     Comment
            .preload(:likes)
            .joins(:likes)
            .group('comments.id')
            .order(Arel.sql('count(likes.id) desc'))
            .limit(10)
  end


  # Users with highest comment count
  # where('comments.created_at >= ?', 1.week.ago.utc)  possibility for future
  def highest_comment_count
    User.preload(:comments).joins(:comments).group('users.id').order(Arel.sql('count(comments.id) desc')).limit(10)
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
    params.require(:comment).permit(:content, :parent_id)
  end

end