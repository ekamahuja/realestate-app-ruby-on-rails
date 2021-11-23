module ApplicationHelper

    def profile_picture(account)
        account.profile_picture.present? ? polymorphic_url(account.profile_picture) : asset_url("placeholder_profile.png")
    end

    def is_seller
        if current_account.role === "buyer"
            return false;
        else 
            return true;
        end
    end

end
