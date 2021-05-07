FactoryBot.define do
  factory :exam do
    category_id         { Random.rand(2..6) }
    date                { Faker::Date.between(from: '2020-01-01', to: '2021-12-31') }
    age                 { Random.rand(18..60) }
    association :government
  end
end
