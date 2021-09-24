class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      
      t.integer :amount
      t.integer :price
      t.integer :order_item_status
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :order_id
      t.integer :item_id

      t.timestamps
    end
  end
end
