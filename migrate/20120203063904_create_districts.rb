class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string :name, :null => false , :limit=>30
      t.integer :city_id, :null => false
      t.integer :is_public , :default=>true

      t.timestamps
    end
    add_index :districts, :name
    add_index :districts, :city_id
    add_index :districts, :is_public
  end

  def self.down
    drop_table :districts
  end
end
