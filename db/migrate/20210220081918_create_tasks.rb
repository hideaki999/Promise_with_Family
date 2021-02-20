class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title ,null: false
      t.text :details
      t.datetime :deadline_at
      t.integer :user_id ,null: false
      t.integer :families_id ,null: false
      t.timestamps
    end
  end
end
