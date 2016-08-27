class AddConfirmationToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :confirmation, :bool
  end
end
