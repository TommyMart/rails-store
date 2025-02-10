Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Expect json API endpoint requests
  scope defaults: { format: :json } do
    root "products#index"
    resources :products
    post "signup", to: "users#signup"
    post "login", to: "users#login"
    patch "users", to: "users#update"
    delete "users", to: "users#destroy"
  end




  # get "/products", to: "products#index"

  # get "/products/new", to: "products#new"
  # post "/products", to: "products#create"

  # get "/products", to: "products#show"

  # get "products/:id/edit", to: "products#edit"
  # patch "products/:id", to: "products#update"
  # put "/products/:id", to: "products#update"

  # delete "/products/:id", to: "products#update"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
