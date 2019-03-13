class AddApprovedToTutor < ActiveRecord::Migration[5.2]
  def self.up
    add_column :tutors, :approved, :boolean, :default => false, :null => false
    add_index  :tutors, :approved
  end

  def self.down
    remove_index  :tutors, :approved
    remove_column :tutors, :approved
  end
end