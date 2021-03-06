class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :properties

  has_many :blogs


  has_one_attached :profile_picture
  has_one_attached :profile_cover_image

  def full_name
      "#{first_name} #{last_name}"
  end
end
