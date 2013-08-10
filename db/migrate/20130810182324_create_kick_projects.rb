class CreateKickProjects < ActiveRecord::Migration
  def change
    create_table :kick_projects do |t|
      t.string :id
      t.string :name
      t.date :expiration_date
      t.string :project_link
      t.string :picture_link
      t.string :video_link
      t.integer :status_id
    end
  end
end
