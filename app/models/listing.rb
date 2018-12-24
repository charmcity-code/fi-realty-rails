class Listing < ApplicationRecord
  belongs_to :user
	has_many :appointments
	has_many :buyers, through: :appointments

	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true, length: { is: 2 }
	validates :zip_code, presence: true, length: { minimum: 5 }
	validates :list_price, presence: true


	# filters listings based on date created
	def self.recent
  	where("created_at >=?", Time.zone.today.beginning_of_day)
	end

	def self.older
  	where("created_at <?", Time.zone.today.beginning_of_day)
	end

end
