FactoryBot.define do
  factory :address do
    trait :pickup do
      id { 1 }
      address1 { 'My Address' }
      address2 { 'My Address 2' }
      city_id { 1 }
      zip_code { '1000' }
    end

    trait :delivery_within do
      id { 2 }
      address1 { 'New Address' }
      address2 { 'New Address 2' }
      city_id { 1 }
      zip_code { '1001' }
    end

    trait :delivery_outside do
      id { 3 }
      address1 { 'Test Address' }
      address2 { 'Test Address 2' }
      city_id { 2 }
      zip_code { '1002' }
    end
  end
end
