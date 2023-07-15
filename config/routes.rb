Rails.application.routes.draw do
  resources :groups, only: %i[index new create] do
    resources :deals, only: [:index]
  end
  get '/deals/new', to: 'deals#new', as: 'new_deal'
  post '/deals', to: 'deals#create', as: 'deals'

  devise_for :users
  # Defines the root path route ("/")
  root 'splash#index'
end
