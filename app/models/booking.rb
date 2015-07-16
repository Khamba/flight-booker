class Booking < ActiveRecord::Base
	belongs_to :flight
	has_many :passengers

	validates :flight_id, presence: true

	accepts_nested_attributes_for :passengers

end
