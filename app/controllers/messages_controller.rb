class MessagesController < ApplicationController
  before_action :authenticate_user!


    def new
      @chosen_recipient = User.confirmed.with_attached_avatar.find_by(id: params[:to].to_i) if params[:to]
    end
  
    def create
      recipients = User.confirmed.with_attached_avatar.where(id: params['recipients'])
      conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
      flash[:success] = "Wiadomość została wysłana!"
      redirect_to conversation_path(conversation)
    end
  end