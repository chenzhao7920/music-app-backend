Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      get "/search", to: "discogs#search_album"
      get "/artists/:artist_id/releases", to: "discogs#artist_releases"
      get "/releases/:release_id", to: "discogs#release"
      get "/masters/:master_id", to: "discogs#master"
    end
  end
end
