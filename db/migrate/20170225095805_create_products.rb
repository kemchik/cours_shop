class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, nil: false
      t.string :image
      t.string :ingredients
      t.string :description, nil: false
      t.float :weight
      t.float :prise, nil: false
      t.integer :user_id
      t.timestamps
    end
  end
end
