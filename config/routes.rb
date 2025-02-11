Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Expect json API endpoint requests
  # Version 1 API routing
  scope defaults: { format: :json } do
    namespace :api do
      namespace :v1 do
        root "products#index"
        resources :products
        resources :repairs
        resources :cars
        resources :owners, only: [ :index, :show, :update ] do
          collection do
            get "search"
          end
        end


        post "signup", to: "users#signup"
        post "login", to: "users#login"
        patch "users", to: "users#update"
        delete "users", to: "users#destroy"
      end
    end
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
