class CreateInventory < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory do |t| 
      t.references :bag, foreign_key: { to_table: :bag_of_holding }
      t.string :itemName
      t.integer :weight
      t.timestamps
    end
  end
end