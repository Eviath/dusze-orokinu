class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index, :trashauthor, :trashreceiver]
  before_action :check_participating!, except: [:index, :trashreceiver, :trashauthor]

  def index
    @conversation = Conversation.find_by(id: params[:id])
    @conversationsauthorpresent = Conversation.author(current_user).authorpresent.newest.page(params[:page]).per_page(5)
    @conversationsreceiverpresent = Conversation.receiver(current_user).receiverpresent.newest.page(params[:page]).per_page(5)
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    @personal_message = PersonalMessage.new
  end

  def trashreceiver
    @conversation = Conversation.find_by(id: params[:id])

      areq = @conversation
      areq.update_attribute(:receiver_deleted, true)

      flash[:success] = "Konwersacja odrzucona przez receiver."
      redirect_to root_url
  
  end

  def trashauthor
    @conversation = Conversation.find_by(id: params[:id])

      areq = @conversation
      areq.update_attribute(:author_deleted, true)

      flash[:success] = "Konwersacja odrzucona przez author."
      redirect_to root_url
  
  end

  private




  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end
end