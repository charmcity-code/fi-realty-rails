class Listing < ApplicationRecord
  belongs_to :user
	has_many :appointments
	has_many :buyers, through: :appointments
end
