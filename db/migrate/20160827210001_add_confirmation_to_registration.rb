class AddConfirmationToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :confirmation, :boolean
  end
end
