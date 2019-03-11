class AddImageAndFirstNameAndLastNameAndCategoryIdAndSubCategoryIdAndDescriptionAndPhoneToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :first_name, :string
    add_column :tutors, :last_name, :string
    add_column :tutors, :category_id, :integer
    add_column :tutors, :sub_category_id, :integer
    add_column :tutors, :description, :text
    add_column :tutors, :phone, :string
  end
end
