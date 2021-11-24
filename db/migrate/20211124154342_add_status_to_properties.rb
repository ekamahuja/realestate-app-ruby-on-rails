class AddStatusToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :status, :string, default:  "avaliable"
  end
end
