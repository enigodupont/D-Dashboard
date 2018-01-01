class CreateStoryLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :story_logs do |t|
      t.string :name
      t.text :body
      t.references :dm foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
