class Comments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name, nil: false
      t.string :comment, nil: false
      t.integer :product_id, nil: false
      t.timestamps
  end
  end
  end
