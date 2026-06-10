class AddPersonIdToPersonInformation < ActiveRecord::Migration[8.1]
  def change
    add_reference :person_informations, :person, null: false, foreign_key: true
  end
end
