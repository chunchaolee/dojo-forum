class AddColumnIsPublishedOnPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :is_published, :boolean, default: true
  end
end
