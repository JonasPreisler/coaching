class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :tutor_id
      t.string :name
      t.string :address
      t.string :contact_person_first_name
      t.string :contact_person_last_name
      t.string :account_number
      t.string :company_type
      t.string :organization_number

      t.timestamps
    end
  end
end
