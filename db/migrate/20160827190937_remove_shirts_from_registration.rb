class RemoveShirtsFromRegistration < ActiveRecord::Migration
  def change
    remove_column :registrations, :xs_shirts, :string
    remove_column :registrations, :s_shirts, :string
    remove_column :registrations, :m_shirts, :string
    remove_column :registrations, :l_shirts, :string
    remove_column :registrations, :xl_shirts, :string
  end
end
