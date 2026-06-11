class AddMiddleNameToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :middle_name, :string
  end
end
