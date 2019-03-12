class AddChannelKeyToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :channel_key, :string
  end
end
