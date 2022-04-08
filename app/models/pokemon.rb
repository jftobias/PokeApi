# frozen_string_literal: true

class Pokemon < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  validates_presence_of :description, :stats, :image_url, :types
end
