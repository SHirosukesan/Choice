class AddImageIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :image_id, :string
  end
end
