FactoryGirl.define do
  factory :eve_item do
    type_id 1
    name "Item"
    price 1.2
    volume 0.5
  end

  factory :blueprint do
    type_id 1
    activities {}
    limit 1
  end
end
