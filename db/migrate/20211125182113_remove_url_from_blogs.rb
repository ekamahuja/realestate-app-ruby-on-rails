class RemoveUrlFromBlogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :url, :string
  end
end
