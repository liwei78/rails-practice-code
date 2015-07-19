class Order < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :line_items
  has_many :variants, through: :line_items
  validates :number, presence: true

  after_create do
    line_items.each do |line_item|
      line_item.variant.decrement!(:on_hand, line_item.quantity)
    end
  end
end
