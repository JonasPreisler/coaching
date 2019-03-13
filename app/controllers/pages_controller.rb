class PagesController < ApplicationController

	def home
		@accounts = Account.all
    @categories = Category.all
	end

	def mobil
	end
	def mobil2
	end
	def ring
	end
	def landing_page
		@sub_categories = SubCategory.all.limit(6)
    @tutors = Tutor.all.limit(15)
	end

	def veiledere
	end

	def contact1
	end

	def contact2
	end
end