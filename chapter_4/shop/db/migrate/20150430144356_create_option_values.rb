class CreateOptionValues < ActiveRecord::Migration
  def change
    create_table :option_values do |t|
      t.integer :position
      t.string :name
      t.references :option_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
