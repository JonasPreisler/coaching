class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :account_id
      t.integer :tutor_id
      t.datetime :datetime
      t.integer :offer_id

      t.timestamps
    end
  end
end
