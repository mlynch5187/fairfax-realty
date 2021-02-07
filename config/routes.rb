Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/listings', to:'listings#index'
  get '/listings/:listing_id', to:'listings#show'

  namespace :admin do
    get "/login", to: 'dashboard#login'
  end
end
