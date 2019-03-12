class AddSlugToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :slug, :string
    add_index :tutors, :slug, unique: true
  end
end
