class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :url
      t.string :summary
      t.text :body
      t.string :image
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
