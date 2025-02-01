FactoryBot.define do
  factory :motorcycle do
    name { "MyString" }
    bio { "MyText" }
    finance_fee { 1 }
    option_to_purchase { 1 }
    total_amount_payable { 1 }
    duration { 1 }
    user { nil }
    image { nil }
  end
end
