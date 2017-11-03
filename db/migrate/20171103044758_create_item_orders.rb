class CreateItemOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :item_orders do |t|
      t.references :item, foreign_key:true, index:true
      t.references :order, foreign_key:true, index:true
    end
  end
end
