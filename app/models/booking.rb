class Booking < ApplicationRecord
	belongs_to :account
	belongs_to :tutor
  validates :tutor_id, :account_id, :start, :end, presence: true


	def time_slots

		start_time = Time.local(2013, 5, 25, 10, 00) 
		  end_time = Time.local(2013, 5, 25, 20, 00) 
		     times = [start_time.strftime('%H:%M')]

	  begin
	    start_time += 5.minutes
	    times << start_time.strftime('%H:%M')
	  end while start_time < end_time

	  times

	end

	def booking_time
		start.strftime('%a %d.%m.%Y') + ' - ' + self.end.strftime('%a %d.%m.%Y')
	end

end
