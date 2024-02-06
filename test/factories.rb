FactoryBot.define do
  factory :user do
    username { "test" }
    email { "test@test.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end