class AddHireDateToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :hire_date, :datetime
  end
end
