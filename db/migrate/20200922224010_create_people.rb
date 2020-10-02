class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :lastName
      t.string :firstName
      t.string :aliases

      t.timestamps
    end
  end
end
