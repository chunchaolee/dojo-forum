class DropDraftsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :drafts
    drop_table :categories_drafts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
