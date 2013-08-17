class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :project_id
      t.integer :min_amount
      t.string :description
      t.date :delivery_date
    end
  end
end
