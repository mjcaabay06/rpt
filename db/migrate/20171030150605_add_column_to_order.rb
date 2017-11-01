class AddColumnToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :discount, :float
    add_column :orders, :discounted_amount, :float
    add_column :orders, :grand_total, :float
  end
end
