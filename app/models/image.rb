class Image < ApplicationRecord
  # Associations
  belongs_to :imageable, polymorphic: true
end
