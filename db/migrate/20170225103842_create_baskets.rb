class CreateBaskets < ActiveRecord::Migration[5.0]
  def change
    create_table :baskets do |t|
      t.integer :user_id, nil: true
      t.integer :product_id, nil: false
      t.integer :amount, nil: false
      t.integer :customer_id, nil: true
      t.timestamps
    end
  end
end
