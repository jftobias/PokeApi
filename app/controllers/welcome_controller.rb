# frozen_string_literal: true

# Welcom controller class
class WelcomeController < ApplicationController
  def index
    SavePokemon if Pokemon.count.zero?
  end
end
