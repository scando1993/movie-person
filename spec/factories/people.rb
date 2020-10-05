FactoryBot.define do
  factory :person do
    firstName { Faker::Name.first_name }
    lastName { Faker::Name.last_name }
    aliases { Faker::Lorem.sentence }
  end
end
