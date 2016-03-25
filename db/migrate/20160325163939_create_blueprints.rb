class CreateBlueprints < ActiveRecord::Migration
  def change
    create_table :blueprints do |t|
      t.integer :type_id
      t.text :activities
      t.integer :limit
    end

    add_index :blueprints, :type_id, unique: true
  end
end
