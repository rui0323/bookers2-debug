Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
   get "home/about"=>"homes#about"
  root to: "homes#top"
 get 'users/new'
 devise_for :users
  
 
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create,:destroy]  
  end
  resources :users, only: [:index,:show,:edit,:update]
  
  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
