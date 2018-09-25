Rails.application.routes.draw do

#   get 'homes/index'
   devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'home#index'

get '/home/about' => 'home#about'

resources :books
resources :users
resources :home
resources :user_images


end
