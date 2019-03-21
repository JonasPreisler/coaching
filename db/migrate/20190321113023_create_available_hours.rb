class CreateAvailableHours < ActiveRecord::Migration[5.2]
  def change
    create_table :available_hours do |t|
      t.datetime :from
      t.datetime :to
      t.integer :tutor_id

      t.timestamps
    end
  end
end
