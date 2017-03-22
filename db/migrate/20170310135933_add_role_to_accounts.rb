class AddRoleToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :role, :integer, default: 0
  end
end
