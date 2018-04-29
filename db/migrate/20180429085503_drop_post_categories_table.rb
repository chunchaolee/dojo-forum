class DropPostCategoriesTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :post_categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
