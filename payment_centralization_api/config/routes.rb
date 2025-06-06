# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :payments, only: [:index, :create]
    end
  end
end