class CreateMaterialKinds < ActiveRecord::Migration
  def change
    create_table :material_kinds do |t|
      t.string :name # 種類名

      t.timestamps
    end

    add_index :material_kinds, :id
  end

end
