class CreateKickProjects < ActiveRecord::Migration
  def change
    create_table :kick_projects do |t|
      t.integer :id
      t.integer :kick_category_id
      t.string :name
      t.date :expiration_date

      t.timestamps
    end
  end
end
