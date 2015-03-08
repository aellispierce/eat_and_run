Rails.application.routes.draw do
  get 'home/index'

  namespace :api do
    namespace :v1 do
      resources :trails
      root 'trails#index'
    end
  end

  root 'home#index'
end
