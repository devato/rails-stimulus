FactoryBot.define do
  factory :organization do
    name { FFaker::Company.name }
    default true
    active  true
  end
end
