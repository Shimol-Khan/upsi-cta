json.extract! announcement, :id, :title, :image_link, :body, :user_id, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
