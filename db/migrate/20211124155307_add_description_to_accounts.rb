class AddDescriptionToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :description, :text
  end
end
