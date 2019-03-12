class AddAnonymousToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :anonymous, :boolean
    add_column :tutors, :gdpr, :boolean
  end
end
