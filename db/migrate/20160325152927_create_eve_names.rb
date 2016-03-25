class CreateEveNames < ActiveRecord::Migration
  def change
    create_table :eve_names do |t|
      t.integer :type_id
      t.string :value
    end

    add_index :eve_names, :type_id, unique: true
  end
end
