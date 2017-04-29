class AddNameToCustomers < ActiveRecord::Migration[5.0]
  def change
      add_column :customers, :first_name, :string, nil: false
      add_column :customers, :surname, :string, nil: false
      add_column :customers, :middle_name, :string, nil: false
    end
end
