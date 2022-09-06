class Venue < ApplicationRecord
  # Associations
  has_many :events
  has_many :images, as: :imageable
end
