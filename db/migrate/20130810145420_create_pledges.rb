class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :kick_project_id
      t.string :id
      t.integer :min_amount
      t.string :description
      t.date :delivery_date

      t.timestamps
    end
  end
end
