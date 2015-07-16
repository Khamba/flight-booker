class BookingsController < ApplicationController

	def new
		@number_of_passengers = params[:booking][:number_of_passengers].to_i
		@flight = Flight.find(params[:booking][:flight_chosen])
		@booking = Booking.new

		@number_of_passengers.times do
			@booking.passengers.build
		end
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			flash[:success] = "Ticket booked successfully"
			redirect_to @booking
		else
			flash.now[:error] = "Error in form"
			render 'bookings/new'
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	private

		def booking_params
			params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
		end

end
