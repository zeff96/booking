FactoryBot.define do
  factory :reservation do
    city { "MyString" }
    date { "2025-02-07" }
    user { nil }
    motorycle { nil }
  end
end
