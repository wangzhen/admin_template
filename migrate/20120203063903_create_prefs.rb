class CreatePrefs < ActiveRecord::Migration
  def self.up
    create_table :prefs do |t|
      t.string :name   , :limit=> 30 , :null => false
      t.boolean :is_public , :default=>true

      t.timestamps
    end
    add_index :prefs , :name
  end

  def self.down
    drop_table :prefs
  end
end
