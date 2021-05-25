class AddItemNoToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :item_no, :string
    add_column :products, :location, :string
  end
end
