class AddSupplierNumberToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :supplier_number, :string
  end
end
