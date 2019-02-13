class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = @commentable.comments
  end

  def new
    @parent_id = params.delete(:parent_id)
    @commentable = find_commentable
    @comment = Comment.new(:parent_id => @parent_id,
                           :commentable_id => @commentable.id,
                           :commentable_type => @commentable.class.to_s)
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Komentarz został zapisany."
      redirect_to @commentable
    else
      flash[:error] = "Wystąpił błąd"
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