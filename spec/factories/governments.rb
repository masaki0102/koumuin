FactoryBot.define do
  factory :government do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    after(:build) do |government|
      government.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
