class CreateMaterialImages < ActiveRecord::Migration
  def change
    create_table :material_images do |t|
      t.references :material, null: false # 外部キー
      t.binary :data, limit: 20.megabytes # 画像データ
      t.string :content_type              # MIMEタイプ 
      t.timestamps
    end

    add_index :material_images, :material_id
  end
end
