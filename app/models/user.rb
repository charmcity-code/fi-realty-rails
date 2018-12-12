class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true

	has_many :listings
  has_many :appointments, through: :listings, source: :user

  # validate unique usernames
end
