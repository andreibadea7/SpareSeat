class Performer < ApplicationRecord
  # Associations
  has_many :events, through: :events_performers
end
