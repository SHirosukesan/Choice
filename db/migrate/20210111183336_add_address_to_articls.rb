class AddAddressToArticls < ActiveRecord::Migration[5.2]
  def change
    add_column :articls, :user_id, :integer
    add_column :articls, :shop_id, :integer
    add_column :articls, :title, :string
  end
end
