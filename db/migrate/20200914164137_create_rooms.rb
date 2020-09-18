class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string     :room_name,         null: false
      t.string     :room_introduction, null: false
      t.string     :genre,             null: false
      t.integer    :user_id,           null: false, foreign_key: true
      t.integer    :status,            null: false, default: 0, limit: 1
      t.timestamps
    end
  end
end
