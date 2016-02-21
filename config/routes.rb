Rails.application.routes.draw do
  root to: 'static_pages#home'
  get   'Settings',to: 'users#edit'
  get   'signup' , to: 'users#new'
  get   'login' ,  to: 'sessions#new'
  post  'login' ,  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
