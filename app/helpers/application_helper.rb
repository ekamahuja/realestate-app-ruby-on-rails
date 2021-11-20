module ApplicationHelper

    def profile_picture(account, width = 100)
        profile_picture = account.profile_picture.attached? ? account.profile_picture : "placeholder.jpg"
        image_tag profile_picture, class: "profile_picture rounded-circle", width: width
    end

    def is_seller
        if current_account.role === "buyer"
            return false;
        else 
            return true;
        end
    end

end
