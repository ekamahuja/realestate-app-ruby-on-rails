class ConversationsController < ApplicationController
    before_action :authenticate_account!  
    before_action :is_sender_recipitent?, only: [:create]
    before_action :set_sidebar
  
    def index
      @accounts = Account.all
      @conversations = Conversation.all
    end
  
    def create
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    end
  
    private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def is_sender_recipitent?
      if params[:sender_id] == params[:recipient_id]
        redirect_to profile_path(current_account.id), alert: "You cannot message yourself." and return
      end
    end

  end