class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def online?
    updated_at > 1.minutes.ago
  end
end
