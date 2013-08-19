class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :kick_id
      t.integer :category_id
      t.string :name
      t.string :description
      t.integer :goal
      t.date :start_date
      t.date :expiration_date
      t.string :project_link
      t.string :picture_link
      t.string :video_link
      t.integer :status_id
    end
  end
end
