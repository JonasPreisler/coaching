class AddCategoryIdToTutorsCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors_categories, :category_id, :integer
  end
end
