class MoviesPerson < ApplicationRecord
  belongs_to :person
  belongs_to :movie

  scope :casting, -> {where('option LIKE ? OR option LIKE ?', 'actor', 'actress' )}
  scope :actors, -> {where(option: 'actor')}
  scope :actress, -> {where(option: 'actress')}
  scope :producers, -> {where(option: 'producer')}
  scope :directors, -> {where(option: 'director')}
end
