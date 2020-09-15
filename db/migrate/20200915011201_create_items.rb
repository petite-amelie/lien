class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,         null: false
      t.string     :item_introduction
      t.integer    :price
      t.integer    :room_id,      null: false,foreign_key: true
      t.integer    :likes_count
      t.timestamps
    end
  end
end
