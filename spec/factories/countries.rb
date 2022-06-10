FactoryBot.define do
  factory :country do
    trait :ph do
      id { 1 }
      name { 'Philippines' }
      iso3 { 'MyString' }
      iso2 { 'MyString' }
      phone_code { 'MyString' }
      currency { 'MyString' }
      currency_symbol { 'MyString' }
    end

    trait :mal do
      id { 2 }
      name { 'Malaysia' }
      iso3 { 'MyString' }
      iso2 { 'MyString' }
      phone_code { 'MyString' }
      currency { 'MyString' }
      currency_symbol { 'MyString' }
    end
  end
end
