class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :variants do |t|
      # t.index [:user_id, :variant_id]
      t.index [:variant_id, :user_id], unique: true
    end
  end
end
