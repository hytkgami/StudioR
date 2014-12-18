class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user           # ユーザID
      t.date :day                  # 予約日
      t.integer :from              # 予約開始時間
      t.integer :to                # 予約終了時間
      t.references :room           # 部屋ID
      t.string :book_id            # 予約ID

      t.timestamps
    end

    add_index :bookings, :id, name: 'book_id_index'
  end
end
