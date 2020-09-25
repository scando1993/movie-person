class Movie < ApplicationRecord
  validates :title, :releaseYear, presence: true
end
