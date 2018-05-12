class RemoveColumeCategoryIdsOnPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :category_ids
  end
end
