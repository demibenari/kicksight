class CreatePushDates < ActiveRecord::Migration
  def change
    create_table :push_dates do |t|
      t.date :push_date
    end
  end
end
