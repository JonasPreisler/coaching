class RoomsController < ApplicationController
  def show
  	@messages = Message.all
  	@tutors = Tutor.all
  end
end
