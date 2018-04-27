class AddColumnLevelOnUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :level, :string, :default => "Normal"
  end
end
