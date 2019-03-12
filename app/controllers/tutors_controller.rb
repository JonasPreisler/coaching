class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]

	def index
		@accounts = Account.all
	end

	def show
	end

	private

    def set_tutor
      @tutor = Tutor.friendly.find(params[:id])
    end


end