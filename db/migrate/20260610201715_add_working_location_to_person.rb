class AddWorkingLocationToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :working_location, :string
    add_column :people, :location_id, :integer
  end
end
