module ApplicationHelper

    def profile_picture(account)
        account.profile_picture.present? ? polymorphic_url(account.profile_picture) : asset_url("placeholders/placeholder_profile.png")
    end

    def flash_notifications
        flash_messages = []

        flash.each do |type, message|
            type = "success" if type == "notice"
            type = "error" if type == "alert"
            text = "toastr['#{type}']('#{message}');"
            flash_messages << text.html_safe unless message.blank?
        end

        "<script>$(function(){ #{ flash_messages.join("\n")} });</script>".html_safe if flash_messages.any?
    end

 

end
