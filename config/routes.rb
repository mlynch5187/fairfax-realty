Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/listings', to:'listings#index'
  get '/listings/:listing_id', to:'listings#show'

  namespace :admin do
    get "/dashboard", to: 'dashboard#index'
    post "/dashboard", to: 'dashboard#index'

    # get "/login", to: "sessions#new"
    # post "/login", to: "sessions#create"
    # get "/logout", to: "sessions#destroy"
  end
end
