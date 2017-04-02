class AddUserToCustomer < ActiveRecord::Migration[5.0]
    def change
      add_column :customers, :user, :integer
    end
end
