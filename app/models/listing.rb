class Listing < ApplicationRecord
  belongs_to :user
	has_many :appointments
	has_many :buyers, through: :appointments

	def self.recent
  	where("created_at >=?", Time.zone.today.beginning_of_day - 3.day)
	end

	def self.older
  	where("created_at <?", Time.zone.today.beginning_of_day - 3.day)
	end

end
