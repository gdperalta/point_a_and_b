FactoryBot.define do
  factory :city do
    trait :city1 do
      id { 1 }
      province_id { 1 }
      name { 'City 1' }
    end

    trait :city2 do
      id { 2 }
      province_id { 2 }
      name { 'City 2' }
    end

    trait :city_outside_ph do
      id { 3 }
      province_id { 3 }
      name { 'City 3' }
    end
  end
end
