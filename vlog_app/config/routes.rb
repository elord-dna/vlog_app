Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/hpj/all', to: 'student#all'
  get 'hpj/insert', to: 'student#insert'
  get 'test', to: 'example#test'
  get 'test2', to: 'example#test2'
  get 'TNum', to:'example#TNum'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
