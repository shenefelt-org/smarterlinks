class AddRehireDateToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :rehire_date, :datetime
  end
end
