Rails.application.routes.draw do
  resources :posts
  resources :comments, only: [:create, :destroy]
  resource :follow, only: [:create, :destroy]
  get 'following', to: 'follows#index'

  root 'welcome#index'
end
