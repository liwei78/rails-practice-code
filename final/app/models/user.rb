class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address, inverse_of: :user, dependent: :delete
  accepts_nested_attributes_for :address

  has_many :orders
  has_many :line_items, through: :orders
  has_and_belongs_to_many :variants
  has_many :cart_items, -> { includes(:variant).order("cart_items.updated_at asc") }

  def admin?
    role == "admin"
  end
end
