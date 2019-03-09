class AddFirstNameAndLastNameAndSubCategoryIdToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :first_name, :string
    add_column :tutors, :last_name, :string
    add_column :tutors, :sub_category_id, :integer
  end
end
