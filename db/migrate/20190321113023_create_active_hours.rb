class CreateActiveHours < ActiveRecord::Migration[5.2]
  def change
    create_table :active_hours do |t|
      t.datetime :start
      t.datetime :end
      t.integer :tutor_id

      t.timestamps
    end
  end
end
