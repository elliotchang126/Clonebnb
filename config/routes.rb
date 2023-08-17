Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post 'api/test', to: 'application#test'

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :index, :show]
    resource :session, only: [:show, :create, :destroy]
    resources :listings, only: [:index, :show]
    resources :reviews, only: [:index, :show, :create, :update, :destroy]

    post 'check_email', to: 'users#check_email'

  end

  get '*path', 
    to: "static_pages#frontend_index",
    constraints: lambda { |req| !req.xhr? && req.format.html? }

  root to: "static_pages#frontend_index"
end
