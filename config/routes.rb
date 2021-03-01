Rails.application.routes.draw do
  get 'user/index'
  resources :comics
  resources :movies
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
