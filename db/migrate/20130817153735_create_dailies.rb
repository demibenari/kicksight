class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.integer :pledge_id
      t.integer :Push_date_id
      t.string :amount_backers_integer
      t.integer :amount_pledged
    end
  end
end
