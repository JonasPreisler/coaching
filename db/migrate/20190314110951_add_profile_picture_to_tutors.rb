class AddProfilePictureToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :profile_picture, :string
  end
end
