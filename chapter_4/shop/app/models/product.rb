class Product < ActiveRecord::Base
  validates :name, presence: true
  scope :hot, -> { where(hot: true) }
  scope :top, -> { where(top: true) }
  has_many :variants
end
