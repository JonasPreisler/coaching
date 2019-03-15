class Review < ApplicationRecord
	belongs_to :account
	belongs_to :tutor
  validates_presence_of :rating, :account_id, :tutor_id
end
