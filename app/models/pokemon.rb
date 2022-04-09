# frozen_string_literal: true

class Pokemon < ApplicationRecord
  include FriendlyId
  friendly_id :name

  validates_presence_of :name, uniqueness: true
  validates_presence_of :description, :stats, :image_url, :types
end
