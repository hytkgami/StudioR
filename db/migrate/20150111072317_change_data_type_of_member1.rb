class ChangeDataTypeOfMember1 < ActiveRecord::Migration
  def change
    change_column :members, :deleted_at, :timestamp
  end
end
