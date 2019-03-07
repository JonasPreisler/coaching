class PagesController < ApplicationController

	def home
		@accounts = Account.all
	end

	def terapeuter
	end

	def contact1
	end

	def contact2
	end
end