class ChangeColumnLevelOnUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :level, :string, :default => "2"
  end
end
