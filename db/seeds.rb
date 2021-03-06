# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
people = (1..10).to_a.map do
  Person.create(
      lastName: Faker::Name.last_name,
      firstName: Faker::Name.first_name,
      aliases: Faker::Lorem.sentence
  )
end

_type = ['actor', 'actress', 'producer', 'director']

10.times do
  movie = Movie.create(
      title: Faker::Book.title,
      releaseYear: Faker::Date.birthday(18, 65).year.to_s
  )

  rand(people.size).times do
    movie.movies_people.create(
        person: people[rand(people.size)],
        option: _type[rand(_type.size)]
    )
  end
end