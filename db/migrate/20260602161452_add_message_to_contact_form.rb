class AddMessageToContactForm < ActiveRecord::Migration[8.1]
  def change
    add_column :contact_forms, :message, :text
  end
end
