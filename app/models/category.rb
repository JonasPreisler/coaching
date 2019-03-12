class Category < ApplicationRecord
  extend FriendlyId
	has_many :sub_categories
  friendly_id :name, use: :slugged
end
