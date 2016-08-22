class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.integer :age
      t.integer :shirt
      t.integer :level
      t.integer :volunteer

      t.timestamps null: false
    end
  end
end
