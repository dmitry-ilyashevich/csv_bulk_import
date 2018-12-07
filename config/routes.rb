Rails.application.routes.draw do
  resources :suppliers, only: [:new ,:create]
  resources :products, only: [:new ,:create]

  root to: 'pages#dashboard'
end
