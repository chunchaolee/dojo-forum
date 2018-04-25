class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :title, :null => false, :limit => 60, :default => "N/A"
      t.text :detail
      t.string :img
      t.string :who_can_see, :default => "all"
      t.integer :replies_count, :default => 0, :index => true
      t.integer :viewed_count, :default => 0, :index => true
      t.integer :user_id, :index => true


      t.timestamps
    end
  end
end
