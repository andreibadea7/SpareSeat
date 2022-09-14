class Venue < ApplicationRecord
  # Associations
  has_many :events
  has_many :images, as: :imageable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def address
    "#{name}, #{city}, #{country}"
  end
end
