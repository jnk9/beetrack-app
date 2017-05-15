Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    scope module: :v1  do
      resources :gps, only: [:create]
    end
  end

  get '/show', to: "home#index"
  get '/get_locations', to: 'home#get_locations'
end
