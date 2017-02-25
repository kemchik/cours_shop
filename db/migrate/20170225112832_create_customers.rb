class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :address, nil: false
      t.string :phone, nil: false
      t.string :email
      t.timestamps
    end
  end
end
