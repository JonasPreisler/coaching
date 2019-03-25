json.extract! booking, :id, :account_id, :tutor_id, :booking, :offer_id, :created_at, :updated_at
json.url order_url(booking, format: :json)
