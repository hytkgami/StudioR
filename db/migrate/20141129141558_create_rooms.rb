class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.boolean :deleted_at        # 削除フラグ

      t.timestamps
    end

    add_index :rooms, :id, name: 'room_id_index'
  end
end
