class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.integer :project_id
      t.integer :push_date_id
      t.integer :amount_backers
      t.integer :amount_pledged
    end
  end
end
