Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trails
    end
  end
end
