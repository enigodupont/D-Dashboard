class CreateBagOfHolding < ActiveRecord::Migration[5.1]
  def change
    create_table :bag_of_holding do |t| 
      t.references :user, foreign_key: { to_table: :users }
      t.string :name
      t.timestamps
    end
  end
end