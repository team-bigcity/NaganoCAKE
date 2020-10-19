class ChangeColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :customers, :last_name, :string, null: false
      change_column :customers, :first_name, :string, null: false
      change_column :customers, :last_name_kana, :string, null: false
      change_column :customers, :first_name_kana, :string, null: false
      change_column :customers, :postcode, :string, null: false
      change_column :customers, :address, :string, null: false
      change_column :customers, :phone_number, :string, null: false
      change_column :customers, :is_deleted, :boolean, default: false, null: false
    end
    def down
      change_column :customers, :last_name, :string
      change_column :customers, :first_name, :string
      change_column :customers, :last_name_kana, :string
      change_column :customers, :first_name_kana, :string
      change_column :customers, :postcode, :string
      change_column :customers, :address, :string
      change_column :customers, :phone_number, :string
      change_column :customers, :is_deleted, :boolean
    end
  end
end
