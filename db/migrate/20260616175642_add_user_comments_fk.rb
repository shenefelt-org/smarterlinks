class AddUserCommentsFk < ActiveRecord::Migration[8.1]
  def change

    change_table :user_comments do |t|
      t.references :posts, null: true, foreign_key: true
    end
  end
end
