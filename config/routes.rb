Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :auth, controller: :auth, only: [:create]
      resources :balances, only: [:index]
    end
  end
end
