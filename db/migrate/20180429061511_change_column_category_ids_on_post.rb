class ChangeColumnCategoryIdsOnPost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :category_ids, :integer, array:true, default: [].to_yaml
  end
end
