Rails.application.routes.draw do
  post "reservations/confirm" => "reservations#confirm"
  post "reservations/back" 
  resources :reservations, only: [:index, :create]
  
  resources :accounts, only: [:show, :edit, :update]
  #post "users/:id/update" => "users#update"
  resources :users
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  
  get "rentals/:user_id/entry" => "rentals#entry"
  get 'rentals/top'
  resources :rentals
  root "rentals#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
