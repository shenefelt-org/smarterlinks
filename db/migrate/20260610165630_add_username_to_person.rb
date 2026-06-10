class AddUsernameToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :username, :string
  end
end
