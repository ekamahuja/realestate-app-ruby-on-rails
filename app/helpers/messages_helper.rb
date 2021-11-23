module MessageHelper
    
    def message_profile_picture(width = 150)
        profile_picture = account.profile_picture.attached? ? account.profile_picture : asset_path("placeholder_profile.png")
        image_tag profile_picture, class: "profile_picture rounded-circle", width: width
    end

end
