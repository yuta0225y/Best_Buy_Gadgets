class DropActiveStorageTables < ActiveRecord::Migration[7.1]
  def up
    # 依存する制約を削除
    remove_foreign_key :active_storage_attachments, :active_storage_blobs if foreign_key_exists?(:active_storage_attachments, :active_storage_blobs)
    remove_foreign_key :active_storage_variant_records, :active_storage_blobs if foreign_key_exists?(:active_storage_variant_records, :active_storage_blobs)

    # テーブルを削除
    drop_table :active_storage_blobs, if_exists: true
    drop_table :active_storage_attachments, if_exists: true
    drop_table :active_storage_variant_records, if_exists: true
  end

  def down
    # テーブルを再作成するコード（必要に応じて）
    raise ActiveRecord::IrreversibleMigration
  end
end
