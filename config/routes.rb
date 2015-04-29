Rails.application.routes.draw do
  resources :posts
  resources :comments, only: [:create, :destroy]

  root 'welcome#index'
end
