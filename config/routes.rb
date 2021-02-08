Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/listings', to:'listings#index'
  get '/listings/:listing_id', to:'listings#show'
  post '/listings', to: 'listings#create'
  patch '/listings/:listing_id', to: 'listings#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    post '/dashboard', to: 'dashboard#index'
    get '/listings/new', to: 'listings#new'
    get '/listings/:listing_id/edit', to: 'listings#edit'
  end
end
