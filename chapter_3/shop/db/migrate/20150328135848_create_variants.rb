class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :product_id
      t.decimal :price
      t.string :size

      t.timestamps null: false
    end
  end
end
