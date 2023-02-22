Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"
  
  resources :user
  resources :posts
  resources :comments, only:[:create,:show,:edit,:update]
  resources :profiles, only:[:create,:show,:edit,:update]

end
