Rails.application.routes.draw do
 root to: "toppages#index"
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 get 'signup', to: 'users#new'
 resources :users
 resources :articles
 resources :parts
 
 resources :posts, only: [:index, :create, :edit, :update, :destroy]
 resources :reads, only: [:create, :destroy]
end
