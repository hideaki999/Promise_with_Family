class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :name
      t.integer :relationship_id
      t.integer :user_id , null: false
      t.timestamps
    end
  end
end
