class AddColorToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :color, :string
  end
end
