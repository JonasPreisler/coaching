class CreateTutorsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors_categories do |t|
      t.integer :tutor_id
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
