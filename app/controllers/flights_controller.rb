class FlightsController < ApplicationController

	def index
		@flights = Flight.all
		@airports = Airport.all
		unless params[:flights_search].nil?
			start_airport_id = @airports.where(code: params[:flights_search][:from]).first.id
			finish_airport_id = @airports.where(code: params[:flights_search][:to]).first.id
			date = params[:flights_search][:date].to_date
			@number_of_passengers = params[:flights_search][:number_of_passengers]
			@flights_searched_for = @flights.where(start_airport_id: start_airport_id).where(finish_airport_id: finish_airport_id).where('start_datetime BETWEEN ? AND ?', date.beginning_of_day, date.end_of_day)
		end
	end

end
