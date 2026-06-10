class CreateContactForms < ActiveRecord::Migration[8.1]
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
