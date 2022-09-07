class EventsPerformer < ApplicationRecord
  # Associations
  belongs_to :event
  belongs_to :performer
end
