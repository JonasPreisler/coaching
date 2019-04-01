class TutorsCategory < ApplicationRecord
	belongs_to :tutor
	belongs_to :sub_category
	after_create :save_category

	def save_category
		self.update_column(:category_id, self.sub_category.category_id)
	end
end
