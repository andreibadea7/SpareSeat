class Venue < ApplicationRecord
  # Associations
  has_many :events
  has_many :images, as: :imageable

  def address
    "#{name}, #{city}, #{country}"
  end
end
