class Buyer < ApplicationRecord
  has_many :appointments
  has_many :listings, through: :appointments

  # validate unique emails

end
