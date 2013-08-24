class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :project_id
      t.integer :min_amount
      t.string :description
      t.date :delivery_date
    end

    execute 'ALTER TABLE `kicksightprod`.`pledges` CHANGE COLUMN `description` `description` VARCHAR(1000) NULL DEFAULT NULL'
  end
end
