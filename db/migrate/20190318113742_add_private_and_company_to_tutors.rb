class AddPrivateAndCompanyToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :private, :boolean
    add_column :tutors, :company, :boolean
  end
end
