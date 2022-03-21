json.extract! order, :id, :number, :user_id, :price, :created_at, :updated_at
json.url order_url(order, format: :json)
