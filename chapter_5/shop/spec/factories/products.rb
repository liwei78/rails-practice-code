# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :product do
    sequence(:name){|n| "name#{n}" }
    price 9.99
  end

end
