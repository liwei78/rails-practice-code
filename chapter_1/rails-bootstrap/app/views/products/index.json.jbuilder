json.array!(@products) do |product|
  json.extract! product, :id, :name, :description
  json.url product_url(product, format: :json)
end
