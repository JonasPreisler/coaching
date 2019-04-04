class ChangeBookingsStartAndEndHours < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :date, :date
    add_column :bookings, :starting_hour, :integer
    add_column :bookings, :ending_hour, :integer

    remove_column :bookings, :start, :datetime
    remove_column :bookings, :end, :datetime
  end
end
