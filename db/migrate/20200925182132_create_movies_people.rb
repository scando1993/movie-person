class CreateMoviesPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :movies_people do |t|
      t.references :person, foreign_key: true
      t.references :movie, foreign_key: true
      t.string :option

      t.timestamps
    end
  end
end
