class Address < ActiveRecord::Base
  belongs_to :user, inverse_of: :address
end
