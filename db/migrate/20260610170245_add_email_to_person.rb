class AddEmailToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :email, :string
  end
end
