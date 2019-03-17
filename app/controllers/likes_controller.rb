class LikesController < ApplicationController
  before_action :find_comment, only: [:create, :destroy]
  before_action :find_like, only: :destroy
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @comment.likes.create(user_id: current_user.id)
      flash[:notice] = "Like added"
      @pre_like = []
      @pre_like << @comment.likes.find { |like| like.user_id == current_user.id}
    end
    respond_to do |format|
      format.html
      format.js {  flash[:notice] = "Komentarz polubiony!" }
    end
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
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
end
