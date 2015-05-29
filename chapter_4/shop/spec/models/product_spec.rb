require 'rails_helper'

RSpec.describe Product, type: :model do
  it "should create a product" do
    tshirt = Product.create(name: "T-Shirt", price: 9.99)

    expect(tshirt.name).to eq("T-Shirt")
    expect(tshirt.price).to eq(9.99)
  end
end
