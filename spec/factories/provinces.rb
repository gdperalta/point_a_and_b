FactoryBot.define do
  factory :province do
    trait :metro_manila do
      id { 1 }
      country_id { 1 }
      name { 'Metro Manila' }
    end

    trait :bulacan do
      id { 2 }
      country_id { 1 }
      name { 'Bulacan' }
    end

    trait :outside_ph do
      id { 3 }
      country_id { 2 }
      name { 'Outside PH' }
    end
  end
end
