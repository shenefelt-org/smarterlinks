class AddDeletedAtToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :deleted_at, :datetime
  end
end
