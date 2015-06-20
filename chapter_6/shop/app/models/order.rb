class Order < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :line_items
  has_many :variants, through: :line_items
  validates :number, presence: true
end
