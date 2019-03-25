class Booking < ApplicationRecord
	belongs_to :account
	belongs_to :tutor
end
