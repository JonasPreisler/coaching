json.extract! review, :id, :tutor_id, :account_id, :comment, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
