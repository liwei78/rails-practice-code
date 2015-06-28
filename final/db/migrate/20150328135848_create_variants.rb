class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.references :product, index: true, foreign_key: true
      t.decimal :price
      t.string :size
      t.timestamps null: false
    end
  end
end
