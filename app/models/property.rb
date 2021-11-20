class Property < ApplicationRecord
    belongs_to :account

    #Active Storage Realtionship with property
    has_one_attached :photo

    # Gete Latest Properties
    scope :latest, -> { order created_at: :desc }

    
    
end
