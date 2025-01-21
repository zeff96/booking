Rails.application.routes.draw do
  resources :motorcycles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :auth do
    post "sign_up", to: "registrations#create"
    post "sign_in", to: "session#create"
    post "account_confirmation", to: "registrations#confirm"
    post "resend_email_confirmation", to: "registrations#resend_email_confirmation"
    post "password_reset", to: "password_resets#create"
    patch "password_update", to: "password_resets#password_update"
  end

end
