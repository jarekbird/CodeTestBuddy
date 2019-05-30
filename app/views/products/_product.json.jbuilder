json.extract! product, :id, :description, :size, :quantity, :cost, :sale_price, :created_at, :updated_at
json.url product_url(product, format: :json)
