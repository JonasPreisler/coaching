class ChangeTutorsOnlineDefaultValueToFalse < ActiveRecord::Migration[5.2]
  def up
    change_column_default :tutors, :online, false
  end

  def down
    change_column_default :tutors, :online, true
  end
end
