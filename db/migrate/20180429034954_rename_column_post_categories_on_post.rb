class RenameColumnPostCategoriesOnPost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :post_categories, :category_ids
  end
end
