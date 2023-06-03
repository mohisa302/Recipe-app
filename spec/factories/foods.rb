FactoryBot.define do
  factory :food do
    name { "Test Food" }
    measurement_unit { "pieces" }
    price { 1.0 }
    quantity { 5 }
    user
  end
end
