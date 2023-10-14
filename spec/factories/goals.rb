FactoryBot.define do
  factory :goal do
    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }
  end
end