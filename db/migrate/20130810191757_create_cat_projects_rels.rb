class CreateCatProjectsRels < ActiveRecord::Migration
  def change
    create_table :cat_projects_rels do |t|
      t.integer :kick_category_id
      t.string :kick_project_id

      t.timestamps
    end

    add_index :cat_projects_rels, :kick_project_id
    add_index :cat_projects_rels, :kick_category_id
  end
end
