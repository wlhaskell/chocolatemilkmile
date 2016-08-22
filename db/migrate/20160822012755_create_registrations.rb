class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :donation
      t.integer :xs_shirts
      t.integer :s_shirts
      t.integer :m_shirts
      t.integer :l_shirts
      t.integer :xl_shirts

      t.timestamps null: false
    end
  end
end
