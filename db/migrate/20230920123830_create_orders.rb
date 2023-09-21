class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :total_price, null: false
      t.integer :postage, null: false

      #default値がわからん
      t.string :status, null: false, default: 0

      t.string :post_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      
      t.string :payment_method, null: false

      t.timestamps
    end
  end
end
