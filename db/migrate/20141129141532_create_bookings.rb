class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :member         # ユーザID
      t.date :day                  # 予約日
      t.integer :from              # 予約開始時間
      t.integer :to                # 予約終了時間
      t.references :room           # 部屋ID
      t.string :book_id            # 予約ID
      t.boolean :mflag         # 機材予約をするかどうか

      t.timestamps
    end

    add_index :bookings, :id
    add_index :bookings, :member_id
  end
end
