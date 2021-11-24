class ContactMailer < ApplicationMailer
    
    def email_agent(agent_id, name, email, message)

        @agent = Account.find(agent_id)
        @name = name
        @email = email
        @message = message

        if @agent.present?
            mail to: @agent.email, message:"Enquiry about one of your listings!"
        end
    end

end