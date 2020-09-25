FactoryBot.define do
  factory :movie do
    title { Faker::Book.title }
    releaseYear { Faker::Date.birthday(18,65)}
  end
end
