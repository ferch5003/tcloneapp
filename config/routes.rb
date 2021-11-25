Rails.application.routes.draw do
  devise_for :users

  resources :feeds, only: %i[index]
  resources :users, only: %i[show] do
    resources :follows, only: %i[index create], controller: 'users/follows'
    resources :followers, only: %i[index create], controller: 'users/followers'
  end

  root 'pages#index'
end
