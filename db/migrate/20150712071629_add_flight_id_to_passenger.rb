class AddFlightIdToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :flight_id, :integer
  end
end
