class ModifyBookings1 < ActiveRecord::Migration
  def change
    add_column :bookings, :deleted_at, :timestamps
  end
end
