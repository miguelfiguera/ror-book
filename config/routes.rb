Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, :controllers => { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"


  resources :users, only: [:index,:show] do
    get 'friends'
  end
  
  resources :posts, :comments, :profiles
  resources :friendships
end
