class AddCustomerToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :customer, :boolean, default: 0
  end
end
