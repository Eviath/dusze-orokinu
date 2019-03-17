class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: [:create, :destroy]
  before_action :find_like, only: :destroy

  def create
    if comment_author? || already_liked?
      flash[:notice] = "Nie możesz polubić tego komentarza"
    else
      @comment.likes.create(user_id: current_user.id)
      @pre_like = []
      @pre_like << @comment.likes.find { |like| like.user_id == current_user.id}
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Nie możesz tego zrobić."
    else
      @like.destroy
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def find_like
    @like = @comment.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, comment_id: params[:comment_id]).exists?
  end

  def comment_author?
    current_user == @comment.user
  end

end
