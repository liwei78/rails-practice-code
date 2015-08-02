class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address, inverse_of: :user
  # accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :address, allow_destroy: true

  has_many :orders
  has_many :line_items, through: :orders
  has_and_belongs_to_many :variants
end
