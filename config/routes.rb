Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # root to: "user#index"
  root 'user#index'
  get 'user/index'
  resources :comics
  resources :movies
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
