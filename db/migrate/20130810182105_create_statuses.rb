class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses, :primary_key => :id do |t|
      t.integer :id
      t.string :description
    end
  end
end
