Rails.application.routes.draw do


  resources :users
root 'posts#index'
resources :posts

end
