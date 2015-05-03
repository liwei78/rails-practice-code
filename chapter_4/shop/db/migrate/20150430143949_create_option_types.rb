class CreateOptionTypes < ActiveRecord::Migration
  def change
    create_table :option_types do |t|
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
