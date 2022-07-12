json.extract! blog_tag, :id, :blog_id, :tag_id, :created_at, :updated_at
json.url blog_tag_url(blog_tag, format: :json)
