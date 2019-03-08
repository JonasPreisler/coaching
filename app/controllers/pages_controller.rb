class PagesController < ApplicationController

	def home
		@accounts = Account.all
    @categories = Category.all
	end

	def veiledere
	end

	def contact1
	end

	def contact2
	end
end