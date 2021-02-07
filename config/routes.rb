Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get "/login", to: 'welcome#login'
  get '/listings', to:'listings#index'
  get '/listings/:listing_id', to:'listings#show'

  namespace :admin do
    post "/dashboard", to: 'dashboard#index'
  end
end
