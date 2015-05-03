class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :address2
      t.string :country
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :phone

      t.timestamps null: false
    end
  end
end
