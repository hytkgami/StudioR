class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name              # 機材名
      t.references :kind          # 機材種別
      t.datetime :deleted_at    # 削除状態

      t.timestamps
    end

    add_index :materials, :id
  end
end
