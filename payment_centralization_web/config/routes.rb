# config/routes.rb (payment_centralization_web)
Rails.application.routes.draw do
  resources :payments, only: [:index, :new, :create]

  # Define a rota raiz para a página de listagem de pagamentos.
  root 'payments#index'
end