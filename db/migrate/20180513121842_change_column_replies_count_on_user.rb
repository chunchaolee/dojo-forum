class ChangeColumnRepliesCountOnUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :replies_count, :integer, default: 0
  end
end
