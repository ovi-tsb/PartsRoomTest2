class AddPlantToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :plant, null: true, foreign_key: true
  end
end
