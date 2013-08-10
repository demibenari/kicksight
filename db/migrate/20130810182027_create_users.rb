class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :primary_key => :email do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
