class AddMinutesAndTutorsToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :minutes, :integer
    add_column :offers, :tutor_id, :integer
  end
end
