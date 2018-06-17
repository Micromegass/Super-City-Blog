Rails.application.routes.draw do
  root 'posts#index'
  delete '/posts/:id', to: 'posts#destroy'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :users, only: [:new, :create]
  resources :posts
  resources :post, only: [:delete]
  delete 'logout', to: 'sessions#destroy'

  

  
end
