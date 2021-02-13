Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/home', to:'static_pages#home'
  get '/signup', to:'users#new'
  get '/login', to:'static_pages#login'
  get '/about_hsp', to:'static_pages#about_hsp'
end