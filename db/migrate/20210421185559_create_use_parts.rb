class CreateUseParts < ActiveRecord::Migration[6.1]
  def change
    create_table :use_parts do |t|
      t.integer :qty
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
