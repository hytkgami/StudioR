class ChangeDataTypeOfMaterial1 < ActiveRecord::Migration
  def change
    change_column :materials, :deleted_at, :timestamp
  end
end
