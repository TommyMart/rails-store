class Owner < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
