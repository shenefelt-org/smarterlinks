class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.integer :id_number

      t.timestamps
    end
  end
end
