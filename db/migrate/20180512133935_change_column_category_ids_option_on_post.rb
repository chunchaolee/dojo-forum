class ChangeColumnCategoryIdsOptionOnPost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :category_ids, :integer, using: 'category_ids::integer[]'
  end
end
