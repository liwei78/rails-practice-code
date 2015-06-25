class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :top, :boolean
    add_column :products, :hot, :boolean
  end
end
