Rails.application.routes.draw do
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check



  resources :cars, only: [:index, :show] do
    resources :reviews, only: [:create]
    resource :favourites, only: [:create, :destroy]
  end

  # resource :favourites, only: create
  get 'favourites', to: 'favourites#index'

  # Root path for the cars list:
  root to: 'pages#home'

end
