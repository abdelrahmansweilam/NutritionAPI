class CreateFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :picture
      t.integer :calories
      t.integer :serving

      t.timestamps
    end
  end
end
