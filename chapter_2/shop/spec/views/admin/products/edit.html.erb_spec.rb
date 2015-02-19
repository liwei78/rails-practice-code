require 'rails_helper'

RSpec.describe "admin/products/edit", type: :view do
  before(:each) do
    @admin_product = assign(:admin_product, Admin::Product.create!())
  end

  it "renders the edit admin_product form" do
    render

    assert_select "form[action=?][method=?]", admin_product_path(@admin_product), "post" do
    end
  end
end
