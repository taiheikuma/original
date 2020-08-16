Rails.application.routes.draw do
 root to: "toppages#index"
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 get 'signup', to: 'users#new'
 get 'about', to: 'abouts#index'
 resources :users
 resources :articles
 resources :schdules
 resources :parts
 
 resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
  member do
   get :reads
  end
 end
 
 resources :reads, only: [:create, :destroy]
end
