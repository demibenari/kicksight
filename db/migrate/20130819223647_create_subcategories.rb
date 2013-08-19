class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :description
      t.integer :category_id
    end
  end
end
