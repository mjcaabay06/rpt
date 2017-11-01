class AddItemAmountToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_amount, :float
  end
end
