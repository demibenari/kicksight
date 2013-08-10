class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges  do |t|
      t.string :kick_project_id
      t.integer :id
      t.integer :min_amount
      t.string :description
      t.date :delivery_date

      t.timestamps
    end

    add_index :pledges, :kick_project_id
  end
end
