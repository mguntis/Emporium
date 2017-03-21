json.extract! product, :id, :title, :seller_info, :description, :amount, :types, :category, :price, :created_at, :updated_at, :created_at, :updated_at
json.url admin_product_url(product, format: :json)
