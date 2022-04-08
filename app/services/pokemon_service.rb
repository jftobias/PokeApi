# frozen_string_literal: true

# This class calls the pokemon from pokeapi.co
class PokemonService
  include HTTParty
  base_uri 'pokeapi.co'

  def initialize(pokemon)
    @pokemon = pokemon
  end

  def pokemon
    self.class.get("/api/v2/pokemon/#{@pokemon}")
  end

  def description
    self.class.get("/api/v2/pokemon-species/#{@pokemon}")
  end
end
