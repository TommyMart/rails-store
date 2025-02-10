class User < ApplicationRecord
  # Automatically adds virtual attributes password and password_confirmation and an authenticate method that checks a given password against the stored hash
  # Requires the password_digest column
  has_secure_password

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :repairs, foreign_key: :mechanic_id
end
