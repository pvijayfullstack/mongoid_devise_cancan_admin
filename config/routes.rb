DeviseTest::Application.routes.draw do
  
  get "dashboard/index"

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "users", :only => [ :edit, :new, :destroy]

  resources :projects

  root :to => 'home#index'

end