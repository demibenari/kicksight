class CreateKickCategories < ActiveRecord::Migration
  def change
    create_table :kick_categories, :primary_key => :id do |t|
      t.integer :id
      t.string :description
    end
  end
end
