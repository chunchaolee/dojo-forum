class AddColumnCategoryIdsOnPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_categories, :integer, :default => []
  end
end
