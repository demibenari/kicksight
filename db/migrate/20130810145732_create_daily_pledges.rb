class CreateDailyPledges < ActiveRecord::Migration
  def change
    create_table :daily_pledges do |t|
      t.string :kick_project_id
      t.integer :pledge_id
      t.date :push_date
      t.integer :amount_backers
      t.integer :amount_pledged

      t.timestamps
    end
  end
end
