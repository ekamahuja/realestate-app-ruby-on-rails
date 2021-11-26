class Blog < ApplicationRecord

    #Active Storage Realtionship with blog
    has_one_attached :image
    belongs_to :account

    scope :latest, -> { order created_at: :desc }
    scope :active, -> { where active: true}

    validates :title, :summary, :body, :image, presence: true
    validates :summary, length: {maximum: 86}
    validates :title, length: {maximum: 73}

end
