class RenameBasketToOrder < ActiveRecord::Migration[5.0]
  def change
    rename_table :baskets, :orders
  end
end
