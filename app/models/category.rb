class Category < ApplicationRecord
  extend FriendlyId
	has_many :sub_categories
	has_many :tutors_categories
	has_many :tutors, -> { distinct }, through: :tutors_categories
  friendly_id :name, use: :slugged

	scope :min_rating, -> (rating) { joins(:reviews).group("tutors.id").having('AVG(reviews.rating) > ?', rating) if rating }
end
