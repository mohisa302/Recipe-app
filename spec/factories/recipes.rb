FactoryBot.define do
  factory :recipe do
    name { "Test Food" }
    preparation_time { 1.0 }
    cooking_time { 1.0 }
    description { " 1.0 " }
    public { true }
    user
  end
end
