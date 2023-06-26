Rails.application.routes.draw do
  devise_for :users

  post '/access-token', to: 'auth#access_token'
  get '/products', to: 'products#index', as: 'products'
  get '/', to: 'index#index', as: 'home'

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :update, :destroy]
      
      # Add the signup route here
      post '/signup', to: 'registrations#create', as: 'signup'
      post '/login', to: 'sessions#create', as: 'login'
      post '/products', to: 'products#create', as: 'create_product'
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations',
        sessions: 'api/v1/sessions',
        passwords: 'api/v1/passwords'
      }
      
      # Add more routes as needed
    end
  end
end
