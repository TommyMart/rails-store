class Invoice < ApplicationRecord
  # One invoice can be related to many jobs
  has_many :repair

  validates :number, presence: true, uniqueness: true
end
