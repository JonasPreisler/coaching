class SettingsController < ApplicationController
	def index
		@tutor = current_tutor
		@documents = @tutor.documents
		@tutors = Tutor.all
	end
end