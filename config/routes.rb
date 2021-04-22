Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/gears" => "gears#index"
    post "/gears" => "gears#create"
    get "/gears/:id" => "gears#show"
    patch "gears/:id" => "gears#update"
    delete "gears/:id" => "gears#destroy"

    get "/packs" => "packs#index"
    post "/packs" => "packs#create"
    get "/packs/:id" => "packs#show"
    patch "packs/:id" => "packs#update"
    delete "packs/:id" => "packs#destroy"

    post "/users" => "users#create"
    delete "users/:id" => "users#destroy"
    get "users/:id" => "users#show"

    post "/sessions" => "sessions#create"
  end
end
