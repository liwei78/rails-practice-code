json.id @product.id
json.name link_to(@product.name, product_path(@product))
json.price number_to_currency(@product.price, unit: "￥")
