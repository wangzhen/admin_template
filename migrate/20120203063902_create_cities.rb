class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name, :null => false , :limit=>30
      t.integer :pref_id, :null => false
      t.boolean :is_public , :default=>true ,  :null => false

      t.timestamps
    end
    add_index :cities, :pref_id
  end

  def self.down
    drop_table :cities
  end
end
