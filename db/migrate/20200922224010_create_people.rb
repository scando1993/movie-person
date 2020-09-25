class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :LastName
      t.string :FirstName
      t.string :Aliases

      t.timestamps
    end
  end
end
