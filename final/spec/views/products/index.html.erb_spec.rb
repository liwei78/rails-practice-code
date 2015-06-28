require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(name: "AAA"),
      Product.create!(name: "BBB")
    ])
    @product = Product.new
  end

  it "renders a list of products" do
    render
  end
end
