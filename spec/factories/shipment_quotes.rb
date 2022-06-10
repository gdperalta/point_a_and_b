FactoryBot.define do
  factory :shipment_quote do
    trait :within do
      id { 1 }
      pickup_address_id { 1 }
      delivery_address_id { 2 }
    end

    trait :outside do
      id { 2 }
      pickup_address_id { 1 }
      delivery_address_id { 3 }
    end
  end
end
