Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'wallets', to: 'wallet#index'
  post 'wallets', to: 'wallet#create'
  patch 'wallet/:id/debit', to: 'wallet#debit'
  patch 'wallet/:id/credit', to: 'wallet#credit'

  # Defines the root path route ("/")
  # root "articles#index"
end
