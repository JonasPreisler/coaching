class AddStatusToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :status, :integer, default: 0
    remove_column :tutors, :approved, :integer
  end
end
