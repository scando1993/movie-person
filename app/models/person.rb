class Person < ApplicationRecord
  has_many :movies_people, dependent: :delete_all
  has_many :movies, through: :movies_people

  def movies_as_actor_or_actress
    movies.merge(MoviesPerson.casting)
  end

  def movies_as_director
    movies.merge(MoviesPerson.directors)
  end

  def movies_as_producer
    movies.merge(MoviesPerson.producers)
  end
end
