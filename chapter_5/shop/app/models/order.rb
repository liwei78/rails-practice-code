class Order < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :line_items
  has_many :variants, through: :line_items
  validates :number, presence: true

  after_create :send_create_email
  def send_create_email
    OrderCreateJob.perform_later(self)
  end
end
