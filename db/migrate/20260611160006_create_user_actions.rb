class CreateUserActions < ActiveRecord::Migration[8.1]
  def change
    create_table :user_actions do |t|
      t.string :action
      t.references :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end
