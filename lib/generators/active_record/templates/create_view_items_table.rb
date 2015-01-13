class CreateViewItemsTable < ActiveRecord::Migration
  def self.up
    create_table :view_items, force: true do |t|
      t.string   :target_type
      t.integer  :target_id
      t.integer  :user_id
      t.string   :ip_address
      t.datetime :viewed_on
    end

    add_index :view_items,  [:target_type, :target_id, :user_id], unique: true
    add_index :view_items,  [:target_type, :target_id, :ip_address], unique: true
  end

  def self.down
    drop_table :view_items
  end
end
