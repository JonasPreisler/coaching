class Tutor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	belongs_to :sub_category
  validates_presence_of :email, :sub_category_id, :first_name, :last_name

end
