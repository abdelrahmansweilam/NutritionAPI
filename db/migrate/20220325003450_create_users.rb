class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :daily_calories
      t.integer :remaining_calories

      t.timestamps
    end
  end
end
