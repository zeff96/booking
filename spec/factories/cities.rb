FactoryBot.define do
  factory :city do
    timezone { "MyString" }
    booking_open { false }
    user { nil }
    motorcycle { nil }
  end
end
