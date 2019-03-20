class Company < ApplicationRecord
	belongs_to :tutor, autosave: true
end
