class Variant < ActiveRecord::Base
  belongs_to :product, touch: true
  has_many :line_item
  has_many :orders, through: :line_item
  has_and_belongs_to_many :users

  after_touch :test_touch
  def test_touch
    puts 'Variant was touched'
  end
end
