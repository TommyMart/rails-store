class Product < ApplicationRecord
  # Presence true = not null
  validates :name, presence: true
end
