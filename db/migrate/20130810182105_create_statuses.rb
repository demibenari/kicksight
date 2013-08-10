class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses, :primary_key => :id do |t|
      t.integer :id
      t.string :description

      t.timestamps
    end

    add_index :statuses, :id
  end
end
