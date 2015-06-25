class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :variant
  belongs_to :user
end
