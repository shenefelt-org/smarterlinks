class CreateMSpaces < ActiveRecord::Migration[8.1]
  def change
    create_table :m_spaces do |t|
      t.string :profile_pic

      t.timestamps
    end
  end
end
