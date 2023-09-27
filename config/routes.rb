Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:edit, :update, :new, :create], path_names: {edit: 'edit'}

  # Defines the root path route ("/")
  root "users#index"
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  get 'users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/new', to: 'posts#new'
  get 'users/:user_id/posts/:id', to: 'posts#show'
  get '/users/:user_id/posts/:id/edit', to: 'posts#edit'


end
