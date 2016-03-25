class AddPriceAndVolumeToEveItems < ActiveRecord::Migration
  def change
    add_column :eve_items, :price, :decimal
    add_column :eve_items, :volume, :decimal
  end
end
