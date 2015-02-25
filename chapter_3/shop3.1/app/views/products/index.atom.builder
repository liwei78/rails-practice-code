atom_feed do |feed|
  feed.title "商品列表"
  feed.updated @products.maximum(:updated_at)

  @products.each do |product|
    feed.entry product, published: product.updated_at do |entry|
      entry.title product.name
      entry.content product.description
      entry.price product.price
    end
  end
end
