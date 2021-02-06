Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/listings', to:'listings#index'
  get '/listings/:listing_id', to:'listings#show'
  # get '/testimonials'; to 'testimonials'
end
