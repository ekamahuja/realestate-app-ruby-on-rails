class AddProfileCoverImageToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :profile_cover_image, :string
  end
end
