class Blog < ApplicationRecord

    #Active Storage Realtionship with blog
    has_one_attached :image

    scope :latest, -> { order created_at: :desc }
    scope :active, -> { where active: false}

end
