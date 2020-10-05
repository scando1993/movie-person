FactoryBot.define do
  factory :movie do
    title { Faker::Book.title }
    releaseYear { Faker::Date.birthday(18, 65).year.to_s }
  end
end
