class PagesController < ApplicationController

  def contract
  end

	def download_contract
    send_file(
      "#{Rails.root}/public/kontrakt.pdf",
      filename: "snakk-med-kontrakt.pdf",
      type: "application/pdf"
    )
  end

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
    @tutors = Tutor.where('approved = ? AND online = ?', true, true).limit(15)
	end

	def thank_you_pending
		
	end


	def veiledere
	end

	def contact1
	end

	def contact2
	end
end