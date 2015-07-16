class Flight < ActiveRecord::Base
	belongs_to :from_airport, class_name: "Airport", foreign_key: :start_airport_id
	belongs_to :to_airport, class_name: "Airport", foreign_key: :finish_airport_id
	has_many :passengers
	has_many :bookings

	def flight_date 
		datetime = self.start_datetime
		date = datetime.strftime("%d %B %Y")
	end

end
