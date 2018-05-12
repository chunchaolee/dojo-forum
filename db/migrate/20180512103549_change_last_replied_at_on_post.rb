class ChangeLastRepliedAtOnPost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :last_replied_at, :datetime
  end
end
