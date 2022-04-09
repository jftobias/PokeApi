# frozen_string_literal: true

# This module is the pokemon controller for the api endpoints
module Api
  class PokemonsController < ApplicationController
    before_action :set_pokemon, only: %i[show]

    # GET /pokemons
    # GET /pokemons.json
    def index
      fuzzy = FuzzyMatch.new(Pokemon.all, read: :name)

      if params[:limit]
        @pokemons = Pokemon.limit(params[:limit])
      elsif params[:query]
        @pokemons = fuzzy.find_all(params[:query])
      else
        @pokemons = Pokemon.limit(10)
      end

      render json: @pokemons
    end

    # GET /pokemons/1
    # GET /pokemons/1.json
    def show
      @pokemon = Pokemon.friendly.find(params[:id])
      render json: @pokemon
    end

    private

    # Use callbacks to share common setup or constraints between actions
    def set_pokemon
      @pokemon = Pokemon.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :description, :types, :stats, :image_url)
    end
  end
end
