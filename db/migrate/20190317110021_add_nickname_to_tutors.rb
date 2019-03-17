class AddNicknameToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :nickname, :string
    add_column :tutors, :job_title, :string
  end
end
