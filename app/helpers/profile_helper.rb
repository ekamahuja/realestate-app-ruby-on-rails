module ProfileHelper

    def profile_cover_image_url(account)
        account.profile_cover_image.present? ? polymorphic_url(account.profile_cover_image) : asset_url("placeholders/placeholder_profile_banner.png")
    end

end
