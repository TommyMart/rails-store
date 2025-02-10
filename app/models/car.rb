class Car < ApplicationRecord
  belongs_to :owner
  has_many :jobs, dependent: :destroy
  has_many :repairs, dependent: :destroy

  validates :make, presence: true
  validates :year, numericality: { only_integer: true }
  validates :speedo, numericality: { only_integer: true }
end
