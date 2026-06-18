class CreateUserComments < ActiveRecord::Migration[8.1]
  def change
    create_table :user_comments do |t|
      t.references :person, null: false, foreign_key: true
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
