class CreateBookedMaterials < ActiveRecord::Migration
  def change
    create_table :booked_materials do |t|
      t.references :booking     # 予約ID
      t.references :material    # 機材ID

      t.timestamps
    end
    add_index :booked_materials, :id
  end
end
