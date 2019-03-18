json.extract! company, :id, :tutor_id, :name, :address, :contact_person_first_name, :contact_person_last_name, :account_number, :company_type, :organization_number, :created_at, :updated_at
json.url company_url(company, format: :json)
