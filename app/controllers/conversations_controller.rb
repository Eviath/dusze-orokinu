class ConversationsController < ApplicationController
  before_action :authenticate_user!

  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :empty_trash]
  before_action :get_box, only: [:index]


    def index
      if @box.eql? "poczta"
        @conversations = @mailbox.inbox
      elsif @box.eql? "wysłane"
        @conversations = @mailbox.sentbox
      else
        @conversations = @mailbox.trash
      end
  
      @conversations = @conversations.paginate(page: params[:page], per_page: 10)
    end
  
    def show
      @conversation.mark_as_read(current_user)
    end
  
    def mark_as_read
      @conversation.mark_as_read(current_user)
      flash[:success] = 'Konwersacja została oznaczona jako przeczytana.'
      redirect_to conversations_path
    end
  
    def reply
      current_user.reply_to_conversation(@conversation, params[:body])
      flash[:success] = 'Odpowiedź została wysłana.'
      redirect_to conversation_path(@conversation)
    end
  
    def destroy
      @conversation.move_to_trash(current_user)
      flash[:success] = 'Konwersacja została przeniesiona do kosza.'
      redirect_to conversations_path
    end
  
    def restore
      @conversation.untrash(current_user)
      flash[:success] = 'Konwersacja została przywrócona.'
      redirect_to conversations_path
    end
  
    def empty_trash
      @mailbox.trash.each do |conversation|
        conversation.receipts_for(current_user).update_all(deleted: true)
      end
      flash[:success] = 'Kosz został wyczyszczony!'
      redirect_to conversations_path
    end
  
    private



    def get_mailbox
      @mailbox ||= current_user.mailbox
    end
  
    def get_conversation
      @conversation ||= @mailbox.conversations.find(params[:id])
    end
  
    def get_box
      if params[:box].blank? or !["poczta","wysłane","kosz"].include?(params[:box])
        params[:box] = 'poczta'
      end
      @box = params[:box]
    end

  end