class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method
      t.integer :order_status
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :customer_id

      t.timestamps
    end
  end
end
