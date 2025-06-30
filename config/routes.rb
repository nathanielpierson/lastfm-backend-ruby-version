Rails.application.routes.draw do
  resources :get_top_albums

  get "up" => "rails/health#show", as: :rails_health_check

  get "get-top-albums" => "get-top-albums#index"
  get "get-top-albums/:id" => "get-top-albums#show"
  post "get-top-albums" => "get-top-albums#create"
  patch "get-top-albums/:id" => "get-top-albums#edit"
  delete "get-top-albums/:id" => "get-top-albums#destroy"
end
