Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/listings', to:'listings#index'
  get '/listings/:listing_id', to:'listings#show'
  post '/listings', to: 'listings#create'
  patch '/listings/:listing_id', to: 'listings#update'
  get '/testimonials', to: 'testimonials#index'
  post '/testimonials', to: 'testimonials#create'
  patch '/testimonials/:testimonial_id', to: 'testimonials#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'consultations', to: 'consultations#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    post '/dashboard', to: 'dashboard#index'
    get '/listings/new', to: 'listings#new'
    get '/listings/:listing_id/edit', to: 'listings#edit'
    get '/testimonials/new', to: 'testimonials#new'
    get '/testimonials/:testimonial_id/edit', to: 'testimonials#edit'
  end
end
