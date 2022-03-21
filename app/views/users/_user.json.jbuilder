json.extract! user, :id, :name, :password, :address, :email, :phone_number, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
