class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :description
    end
  end
end
