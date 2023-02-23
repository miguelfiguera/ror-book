Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"
  
  resources :users, only: [:index,:show]
  resources :posts
  resources :comments, only:[:create,:index,:edit,:update]
  resources :profiles, only:[:new,:create,:show,:edit,:update]
  resources :friendships, only: [:create,:new,:destroy,:index]
end
