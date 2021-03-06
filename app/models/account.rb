class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name, unless: :guest?
  has_many :reviews
  has_many :bookings

  def name
  	first_name + ( ) + last_name
  end

end
