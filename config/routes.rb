Rails.application.routes.draw do
  root 'posts#index'
  delete '/posts/:id', to: 'posts#destroy'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :users, only: [:new, :create]
  resources :posts do 
      resources :comments, only: [:create]
  end 

  resources :post, only: [:delete]
  delete 'logout', to: 'sessions#destroy'


  
end
