class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name            # 名前
      t.string :tel             # 電話番号
      t.string :email           # メールアドレス
      t.boolean :administrator, null: false, default: false  # 管理者フラグ
      t.boolean :deleted, default: false      # 削除状態

      t.timestamps
    end

    add_index :members, :id,  name: 'user_id_index'
  end
end
