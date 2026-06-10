class CreateTimeEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :time_entries do |t|
      t.references :person, null: false, foreign_key: true
      t.string :action
      t.datetime :time

      t.timestamps
    end
  end
end
