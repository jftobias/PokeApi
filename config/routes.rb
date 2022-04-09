Rails.application.routes.draw do
  resources :pokemons
  root "welcome#index"
  namespace :api do
    resources :pokemons
  end
end
