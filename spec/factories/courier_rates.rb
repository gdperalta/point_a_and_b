FactoryBot.define do
  factory :courier_rate do
    trait :lalamove do
      name { 'Lalamove' }
      within_metro_manila { 100 }
      outside_metro_manila { nil }
      delivery_option { 0 }
    end

    trait :grab do
      name { 'Grab' }
      within_metro_manila { 120 }
      outside_metro_manila { nil }
      delivery_option { 0 }
    end

    trait :jnt_express do
      name { 'J&T Express' }
      within_metro_manila { 80 }
      outside_metro_manila { 100 }
      delivery_option { 1 }
    end

    trait :lbc do
      name { 'LBC' }
      within_metro_manila { 100 }
      outside_metro_manila { 120 }
      delivery_option { 1 }
    end
  end
end
