class SubCategory < ApplicationRecord
  extend FriendlyId
	belongs_to :category
  friendly_id :name, use: :slugged
  has_many :tutors_categories
	has_many :tutors, through: :tutors_categories

	def long_name
		name + (' - ') + category.name
	end
end
