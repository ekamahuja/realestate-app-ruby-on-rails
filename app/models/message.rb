class Conversation < ApplicationRecord
    belongs_to :conversation
    belongs_to :Account

    validates_presence_of :body, :conversation_id, :account_id

    def message_time
        created_at.strftime("%m/%d/%y at %l:%M %p")
    end
end
  