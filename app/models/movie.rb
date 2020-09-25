class Movie < ApplicationRecord
  validates :title, :releaseYear, presence: true
  has_many :movies_people
  has_many :people, through: :movies_people

  def casting
    people.merge(MoviesPerson.casting)
  end

  def directors
    people.merge(MoviesPerson.directors)
  end

  def producers
    people.merge(MoviesPerson.producers)
  end

end
