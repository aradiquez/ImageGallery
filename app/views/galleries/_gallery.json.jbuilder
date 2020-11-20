json.extract! gallery, :id, :name, :author, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
