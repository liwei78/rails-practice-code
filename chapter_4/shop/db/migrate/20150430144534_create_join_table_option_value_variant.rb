class CreateJoinTableOptionValueVariant < ActiveRecord::Migration
  def change
    create_join_table :option_values, :variants do |t|
      # t.index [:option_value_id, :variant_id]
      # t.index [:variant_id, :option_value_id]
    end
  end
end
