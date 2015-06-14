class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :number
      t.string :payment_state
      t.string :shipment_state

      t.timestamps null: false
    end
  end
end
