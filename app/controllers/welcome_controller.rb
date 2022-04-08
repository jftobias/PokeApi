# frozen_string_literal: true

# Welcom controller class
class WelcomeController < ApplicationController
  def index
    SavePokemon if Pokemon.count == 0
  end
end
