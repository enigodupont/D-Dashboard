class CreateQuestLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :quest_logs do |t|
      t.references :dm, foreign_key: { to_table: :users}
      t.string :title
      t.text :log
      t.timestamps
    end
  end
end
