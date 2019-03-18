class AddOnlineToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :online, :boolean, default: :false
  end
end
