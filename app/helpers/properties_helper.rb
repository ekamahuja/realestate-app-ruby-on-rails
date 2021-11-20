module PropertiesHelper
    def property_thumbnail(property)
        photo = property.photo.attached? ? property.photo : "placeholder.jpg"
        image_tag photo, class: "bd-placeholder-img card-img-top", width: "100%", height: "225"
    end

    def property_photo_url(property)
        property.photo.present? ? polymorphic_url(property.photo) : asset_url("placeholder.jpg")
    end

    def display_price(price)
        display_amnt = number_to_currency(price, :precision => 0) 
    end

    def calculate_repayment(price)
        downpayment = price * 0.20
        price = price - downpayment
        repayment = price / 360
        repayment = display_price(repayment)
    end
end
