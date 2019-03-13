class TutorsCategory < ApplicationRecord
	belongs_to :tutor
	belongs_to :sub_category
end
