Rails.application.routes.draw do
  root 'static_pages#home'
  
  #施設管理ユーザーのログイン用ルーティング
  # get 'facilities/new'
  get  '/facilities_signup',  to: 'facilities#new'
  get    '/facilities_login',   to: 'sessions#facilities_new'
  post   '/facilities_login',   to: 'sessions#facilities_create'
  delete '/facilities_logout',  to: 'sessions#facility_destroy'
  
  #一般ユーザーのログイン用ルーティング
  get 'users/new'
  get '/home', to:'static_pages#home'
  # get '/login', to:'static_pages#login'
  get '/about_hsp', to:'static_pages#about_hsp'
  get '/signup', to:'users#new'
  
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#user_destroy'
  
  #施設登録用ルーティング
  get '/add_my_facilities', to: 'my_facilities#new'
  post   '/add_my_facilities',   to: 'my_facilities#create'
  
  #static_pages用ルーティング
  get '/about_pax', to:'static_pages#about_pax'
  
  
  get '/restraunt', to:'my_facilities#restraunt_index'
 
  resources :users
  resources :facilities
  resources :my_facilities, only:[:create, :destroy]
end