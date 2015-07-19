class AddOnHandToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :on_hand, :integer
  end
end
