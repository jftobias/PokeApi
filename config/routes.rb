Rails.application.routes.draw do
  resources :pokemons
  root "welcome#index"
end
