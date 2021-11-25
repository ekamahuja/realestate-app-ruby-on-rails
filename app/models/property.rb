class Property < ApplicationRecord
    belongs_to :account

    #Active Storage Realtionship with property
    has_one_attached :photo

    # Get Latest Properties
    scope :latest, -> { order created_at: :desc }

    scope :sold, -> { where for_sale: true, status: "sold" }
    scope :for_sale, -> { where for_sale: true, status: "avaliable" }
    scope :leased, -> { where for_sale: false, status: "leased" }
    scope :for_rent, -> { where for_sale: false, status: "avaliable" }
    scope :avaliable, -> { where status: "avaliable" }

    validates :name, :address, :price, :rooms, :bathrooms, :parking_spaces, :description, :photo,  presence: true


    
    
end
