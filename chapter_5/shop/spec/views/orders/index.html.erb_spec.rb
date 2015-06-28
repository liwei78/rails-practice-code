require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(),
      Order.create!()
    ])
  end

  it "renders a list of orders" do
    render
  end
end
