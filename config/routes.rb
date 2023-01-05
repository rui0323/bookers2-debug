Rails.application.routes.draw do
   get "home/about"=>"homes#about"
  root to: "homes#top"
 get 'users/new'
 devise_for :users
  
 
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create]  
  end
  resources :users, only: [:index,:show,:edit,:update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
