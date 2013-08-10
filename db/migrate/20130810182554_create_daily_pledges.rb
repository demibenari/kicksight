class CreateDailyPledges < ActiveRecord::Migration
  def change
    create_table :daily_pledges do |t|
      t.integer :pledge_id
      t.date :push_date
      t.integer :amount_bakcers
      t.integer :amount_pledges
    end
  end
end
