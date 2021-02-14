Rails.application.routes.draw do
  root 'static_pages#home'
  get 'users/new'
  get '/home', to:'static_pages#home'
  # get '/login', to:'static_pages#login'
  get '/about_hsp', to:'static_pages#about_hsp'
  get '/signup', to:'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end