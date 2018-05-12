class AddColumnCategoryIdsOnPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :category_ids, :integer, using: 'category_ids::integer[]'
  end
end
