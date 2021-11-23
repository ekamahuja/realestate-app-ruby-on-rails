class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :user_id, :account_id
  end
end
