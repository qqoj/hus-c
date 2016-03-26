FactoryGirl.define do
  sequence :type_id

  factory :eve_item do
    type_id
    name "Item"
    price 1.2
    volume 0.5
  end

  factory :blueprint do
    transient do
      name "A"
    end

    type_id
    activities { {
        manufacturing: {
            products: [
                {quantity: 1, typeID: generate(:type_id)}.stringify_keys
            ]
        }.stringify_keys
    }.stringify_keys }
    limit 1

    after(:create) do |blueprint, evaluator|
      create(:eve_item, type_id: blueprint.type_id, name: "#{evaluator.name} Blueprint")
      create(:eve_item, type_id: blueprint.products.first['typeID'], name: "#{evaluator.name}")
    end
  end
end
