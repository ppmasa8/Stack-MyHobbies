json.extract! game, :id, :title, :platform, :status, :created_at, :updated_at
json.url game_url(game, format: :json)
