Rails.application.routes.draw do

  get 'sessions/new'

  root   'books#home'
  get    '/home',          to: 'books#home'
  get    '/new',           to: 'books#new'
  get    '/login',         to: 'sessions#new'
  post   '/login',         to: 'sessions#create'
  delete '/logout',        to: 'sessions#destroy' 
  get    '/search',        to: 'books#search'
  post   '/search_index',  to: 'books#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :books
 resources :authors
end
