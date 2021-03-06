class AddColumnRepliesCountOnUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :replies_count, :integer

    User.pluck(:id).each do |i|
      User.reset_counters(i, :replies)
    end

  end
end
