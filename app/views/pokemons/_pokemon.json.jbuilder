# frozen_string_literal: true

json.extract! pokemon, :id, :name, :description, :types, :stats, :image_url, :created_at,
              :updated_at
json.url pokemon_url(pokemon, format: :json)
