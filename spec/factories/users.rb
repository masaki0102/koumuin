FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    birth_date            { Faker::Date.birthday }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
