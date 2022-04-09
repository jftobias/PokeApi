# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show]

  # GET /pokemons
  # GET /pokemons.json
  def index
    @pokemons = Pokemon.all

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
