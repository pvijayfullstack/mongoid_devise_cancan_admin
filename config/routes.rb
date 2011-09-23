DeviseTest::Application.routes.draw do
  
  devise_for :users, :controller => { :registrations => "registrations"}
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "users"

  resources :projects

  root :to => 'home#index'

  end
