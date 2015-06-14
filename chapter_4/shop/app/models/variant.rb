class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :line_item
  has_many :orders, through: :line_item
  has_and_belongs_to_many :users
end
