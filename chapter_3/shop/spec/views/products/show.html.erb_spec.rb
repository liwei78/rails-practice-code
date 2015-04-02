require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
