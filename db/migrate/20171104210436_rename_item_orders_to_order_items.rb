class RenameItemOrdersToOrderItems < ActiveRecord::Migration[5.1]
  def change
    rename_table :item_orders, :order_items
  end
end
