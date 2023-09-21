class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, null: false, foreign_key: true
      
      t.boolean :is_sale, null: false, default: false
      
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
