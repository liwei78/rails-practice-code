require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(name: "AAA"))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do
    end
  end
end
