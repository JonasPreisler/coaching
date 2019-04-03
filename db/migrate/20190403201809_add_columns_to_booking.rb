class AddColumnsToBooking < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :start_date, :date
  	add_column :bookings, :start_time, :time
  	add_column :bookings, :end_time, :time
  end
end
