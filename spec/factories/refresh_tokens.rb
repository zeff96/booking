FactoryBot.define do
  factory :refresh_token do
    token { "MyString" }
    expiry { "2025-02-09" }
    is_valid { false }
    user { nil }
  end
end
