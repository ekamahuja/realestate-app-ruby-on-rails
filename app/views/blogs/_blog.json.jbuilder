json.extract! blog, :id, :title, :url, :summary, :body, :image, :active, :created_at, :updated_at
json.url blog_url(blog, format: :json)
