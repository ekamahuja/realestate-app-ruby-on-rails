module PropertiesHelper
    def property_thumbnail(property)
        photo = property.photo.attached? ? property.photo : "placeholder.jpg"
        image_tag photo, class: "bd-placeholder-img card-img-top", width: "100%", height: "225"
    end

    def property_photo(property)
        photo = property.photo.attached? ? property.photo : "placeholder.jpg"
        image_tag photo, class: "bd-placeholder-img card-img-top", width: "100%", height: "225"
    end

    def property_bathroom(property)
    bathrooms = property.rooms - property.bathrooms
        if bathrooms < 0
            return bathrooms * -1;
        else 
            return bathrooms
        end

    end
end
