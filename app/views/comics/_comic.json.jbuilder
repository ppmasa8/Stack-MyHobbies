json.extract! comic, :id, :year, :title, :abstract, :status, :created_at, :updated_at
json.url comic_url(comic, format: :json)
