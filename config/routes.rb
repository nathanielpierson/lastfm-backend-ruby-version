Rails.application.routes.draw do
  resources :get_top_albums

  get "up" => "rails/health#show", as: :rails_health_check

  get "top-albums" => "top_albums#index"
  get "top-albums/:id" => "top_albums#show"
  get "/fetchtest" => "lastfm_fetcher#get_album_data"
  post "top-albums" => "top_albums#create"
  patch "top-albums/:id" => "top_albums#edit"
  delete "top-albums/:id" => "top_albums#destroy"
end
