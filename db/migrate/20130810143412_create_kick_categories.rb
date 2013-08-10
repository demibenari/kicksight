class CreateKickCategories < ActiveRecord::Migration
  def change
    create_table :kick_categories do |t|
      t.integer :id
      t.string :description

      t.timestamps
    end
  end
end
