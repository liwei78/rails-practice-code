require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:admin_products, [
      Admin::Product.create!(),
      Admin::Product.create!()
    ])
  end

  it "renders a list of admin/products" do
    render
  end
end
