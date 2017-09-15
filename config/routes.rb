Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :gps, only: [:create]
    end
  end

  root to: 'home#index'
  get '/locations', to: 'home#locations'
end
