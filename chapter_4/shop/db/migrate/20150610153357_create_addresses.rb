class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :state
      t.string :city
      t.string :address
      t.string :address2
      t.string :zipcode
      t.string :receiver
      t.string :phone

      t.timestamps null: false
    end
  end
end
