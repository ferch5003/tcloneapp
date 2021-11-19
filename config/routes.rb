Rails.application.routes.draw do
  devise_for :users

  resources :feeds, only: %i[index]

  root 'pages#index'
end
