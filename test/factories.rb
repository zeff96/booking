FactoryBot.define do
  factory :user do
    username { "test" }
    email { "test@test.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

FactoryBot.define do
  factory :motorcircle do
    name { "Vespas" }
    image { "http://image@example.com" }
    finance_fee { 100 }
    option_to_purchase { 150 }
    total_amount_payable { 200 }
    duration { 48 }
  end
end