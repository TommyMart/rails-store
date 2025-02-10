class Repair < ApplicationRecord
  belongs_to :car
  belongs_to :mechanic, class_name: "User"
  belongs_to :invoice, optional: true

  validates :cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
