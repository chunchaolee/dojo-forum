class AddColumnCategoryIdsOnPost < ActiveRecord::Migration[5.1]
  def change

    if column_exists? :posts, :category_ids
      remove_column :posts, :category_ids
    end

    add_column :posts, :category_ids, :integer, using: 'category_ids::integer[]'

  end
end
