class Blog < ApplicationRecord

    #Active Storage Realtionship with blog
    has_one_attached :image

    scope :active, -> { where active: false}

end
