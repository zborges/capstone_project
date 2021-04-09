Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/gears" => "gears#index"
    post "/gears" => "gears#create"
    get "/gears" => "gears#show"
    patch "gears/:id" => "gears#update"
    delete "gears/:id" => "gears#destroy"

    get "/packs" => "packs#index"
    post "/packs" => "packs#create"
    get "/packs" => "packs#show"
    patch "packs/:id" => "packs#update"
    delete "packs/:id" => "packs#destroy"

    post "/users" => "users#create"
    delete "users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"
  end
end
