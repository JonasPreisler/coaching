class PagesController < ApplicationController

	def home
		@accounts = Account.all
    @categories = Category.all
	end

	def mobil
	end
	def mobil2
	end
	def home_mobile
	end

	def veiledere
	end

	def contact1
	end

	def contact2
	end
end