Rails.application.routes.draw do
  devise_for :users

  resources :feeds, only: %i[index]
  resources :search_users, only: %i[new create]
  resources :tweets, only: %i[new create]
  resources :users, only: %i[show] do
    resources :follows, only: %i[index create], controller: 'users/follows'
    resources :followers, only: %i[index create], controller: 'users/followers'
  end

  root 'pages#index'
end
