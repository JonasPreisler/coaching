class AddGdprToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :gdpr, :boolean
  end
end
