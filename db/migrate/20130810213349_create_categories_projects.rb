class CreateCategoriesProjects < ActiveRecord::Migration
  def change
    create_table :categories_projects do |t|
      t.integer :kick_category_id
      t.string :kick_project_id
    end
  end
end
