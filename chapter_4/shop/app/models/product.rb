class Product < ActiveRecord::Base
  validates :name, presence: true
  def to_liquid
    {
      "name" => name,
      "price" => price
    }
  end
end
