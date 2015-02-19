require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    @admin_product = assign(:admin_product, Admin::Product.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
