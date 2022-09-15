class Venue < ApplicationRecord
  # Associations
  has_many :events
  has_many :images, as: :imageable
  geocoded_by :address_to_geocode
  after_validation :geocode, if: :will_save_change_to_address?

  def address_to_geocode
    name.include?("Stadium") ? name : "#{name} Stadium"
  end
end
