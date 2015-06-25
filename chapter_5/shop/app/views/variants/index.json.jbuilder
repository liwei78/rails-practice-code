json.array!(@variants) do |variant|
  json.extract! variant, :id, :product_id, :price, :size
  json.url variant_url(variant, format: :json)
end
