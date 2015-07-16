# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def toggle(x)
	if x == 1
		return 2
	else
		return 1
	end
end

Airport.create(code: "NYC")
Airport.create(code: "SFO")

seven_days = 60*60*24*7

80.times do
	r = rand(1..2)
	datetime = DateTime.now + rand(-seven_days..seven_days)
	datetime = datetime..strftime('%Y-%m-%d %H:%M:%S')
	Flight.create!(start_airport_id: r, finish_airport_id: toggle(r), start_datetime: datetime, duration: rand(2..9) * 3600 )
end