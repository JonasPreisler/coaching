class SubCategory < ApplicationRecord
  extend FriendlyId
	belongs_to :category
  friendly_id :name, use: :slugged
	has_many :tutors
end
