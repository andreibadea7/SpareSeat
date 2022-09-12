class Event < ApplicationRecord
  # Associations
  belongs_to :venue
  has_many :tickets
  has_many :performers, through: :events_performers

  # Pagination
  paginates_per 24
end
