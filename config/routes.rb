Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    scope module: :v1  do
      resources :gps, only: [:create]
    end
  end
end
