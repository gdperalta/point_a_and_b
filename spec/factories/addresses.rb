FactoryBot.define do
  factory :address do
    trait :pickup do
      address1 { 'My Address' }
      address2 { 'My Address 2' }
      city { 'City' }
      province { 'Metro Manila' }
      country { 'Philippines' }
      zip_code { '1000' }
    end

    trait :delivery_within do
      address1 { 'New Address' }
      address2 { 'New Address 2' }
      city { 'New City' }
      province { 'Metro Manila' }
      country { 'Philippines' }
      zip_code { '1001' }
    end

    trait :delivery_outside do
      address1 { 'Test Address' }
      address2 { 'Test Address 2' }
      city { 'Test City' }
      province { 'Bulacan' }
      country { 'Philippines' }
      zip_code { '1002' }
    end
  end
end
