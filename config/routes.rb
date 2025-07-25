Rails.application.routes.draw do
  resources :get_top_albums

  get "up" => "rails/health#show", as: :rails_health_check

  get "top-albums-backend" => "top_albums#index"
  get "top-albums-backend/:id" => "top_albums#show"
  # fetchtest is currently the code to generate artists and albums for top-albums-backend
  get "/fetchtest" => "top_albums#edit"
  post "top-albums-backend" => "top_albums#create"
  patch "top-albums-backend/:id" => "top_albums#edit"
  delete "top-albums-backend/:id" => "top_albums#destroy"

  get "/top-albums-from-api" => "top_albums_from_api#index"
end
