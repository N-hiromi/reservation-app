Rails.application.routes.draw do
  resources :reservations, only: [:index, :show]
  resources :accounts
  resources :users
  post "login" => "accounts#login"
  post "logout" => "accounts#logout"
  get "login" => "accounts#login_form"
  
  get "rentals/:user_id/entry" => "rentals#entry"
  get 'rentals/top'
  resources :rentals do
    post "reservations/confirm" => "reservations#confirm"
    post "reservations/back" 
    post "reservations/complete"
  end
  root to: "rentals#top"
end
