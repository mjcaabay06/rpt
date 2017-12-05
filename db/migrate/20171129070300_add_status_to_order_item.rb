class AddStatusToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :status, foreign_key: true
  end
end
