Rails.application.routes.draw do
  root 'root#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :auth do
    post "signup", to: "registrations#create"
    post "account_confirmation", to: "registrations#account_confirmation"
    post "login", to: "session#create"
    post "reset_password", to: "passwords#reset_password"
    post "edit_password", to: "passwords#update_password"
  end

  resources :motorcircles, only: %i[index show new create edit update destroy]
end
