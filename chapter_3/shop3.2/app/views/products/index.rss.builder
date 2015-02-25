xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "商品列表"
    xml.description "这是商品列表"
    xml.link products_url

    @products.each do |product|
      xml.item do
        xml.title product.name
        xml.description product.description
        xml.price product.price
        xml.link product_url(product)
        xml.guid product_url(product)
      end
    end
  end
end
