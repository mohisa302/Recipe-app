FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    confirmed_at { Time.now } # This line confirms the user by default
  end
end
