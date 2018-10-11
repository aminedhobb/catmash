FactoryBot.define do
  factory :cat do
    url   { Faker::Internet.url }
    auid  { SecureRandom.uuid }
  end
end