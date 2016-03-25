class RenameEveNameToEveItem < ActiveRecord::Migration
  def change
    rename_table :eve_names, :eve_items
    rename_column :eve_items, :value, :name
  end
end
