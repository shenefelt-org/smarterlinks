class CreatePersonInformations < ActiveRecord::Migration[8.1]
  def change
    create_table :person_informations do |t|
      t.string :address
      t.date :dob

      t.timestamps
    end
  end
end
