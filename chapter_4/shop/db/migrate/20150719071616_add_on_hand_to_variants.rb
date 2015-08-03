class AddOnHandToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :on_hand, :integer, default: 0
  end
end
