module BlogsHelper
    def blog_thumbnail(post)
        image = post.image.attached? ? post.image : "placeholder_profile.png"
        image_tag image, class: "bd-placeholder-img card-img-top", width: "100%", height: "225"
    end
end
