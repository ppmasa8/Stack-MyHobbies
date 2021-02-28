json.extract! movie, :id, :year, :title, :abstract, :status, :created_at, :updated_at
json.url movie_url(movie, format: :json)
