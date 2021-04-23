class RemoveProductIdFromYseParts < ActiveRecord::Migration[6.1]
  def change
    remove_column :use_parts, :product_id, :bigint
  end
end
