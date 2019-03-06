class AddChannelKeyToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :channel_key, :string
  end
end
