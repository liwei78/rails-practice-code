require 'rails_helper'

RSpec.describe "admin/products/new", type: :view do
  before(:each) do
    assign(:admin_product, Admin::Product.new())
  end

  it "renders new admin_product form" do
    render

    assert_select "form[action=?][method=?]", admin_products_path, "post" do
    end
  end
end
