FactoryBot.define do
  factory :courier_rate do
    name { "MyString" }
    within_metro_manila { 1 }
    outside_metro_manila { 1 }
    delivery_option { 1 }
  end
end
