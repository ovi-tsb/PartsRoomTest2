class AddManufacturerAndManufacturerNoToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :manufacturer_name, :string
    add_column :products, :manufacturer_no, :string
  end
end
