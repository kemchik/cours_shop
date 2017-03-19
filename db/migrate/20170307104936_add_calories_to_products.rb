class AddCaloriesToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :calories, :float
  end

end
