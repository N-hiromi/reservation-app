Rails.application.routes.draw do
  resources :reservations, only: [:index]
  resources :accounts, only: [:show, :edit, :update]
  resources :users
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  
  get "rentals/:user_id/entry" => "rentals#entry"
  get 'rentals/top'
  resources :rentals do
    post "reservations/confirm" => "reservations#confirm"
    post "reservations/back" 
    post "reservations/complete"
    get "reservations/:id/show" => "reservations#show"
  end
  root "rentals#top"
end
