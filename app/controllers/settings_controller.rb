class SettingsController < ApplicationController
	def index
		@tutor = current_tutor
		@documents = @tutor.documents
		@tutors = Tutor.all
    @sub_categories = SubCategory.all
    @bookings = Booking.where(tutor_id: @tutor)
	end

end