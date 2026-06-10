class AddTerminationDateToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :term_date, :datetime
  end
end
