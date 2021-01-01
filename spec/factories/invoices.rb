require 'faker'

FactoryBot.define do
  factory :invoice do
    title {  Faker::Lorem.sentence(word_count: 2, supplemental: false) }
    description { Faker::Lorem.sentence(word_count: 5, supplemental: true) }
    category { ['Traveling', 'Clothing', 'Taxi', 'Cafes', 'Shops', 'Other'].sample }
    amount { rand(50..500) }
    user
  end
end
