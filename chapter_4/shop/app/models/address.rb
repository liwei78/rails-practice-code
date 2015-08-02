class Address < ActiveRecord::Base
  belongs_to :user, inverse_of: :address, :dependent: :destroy
end
