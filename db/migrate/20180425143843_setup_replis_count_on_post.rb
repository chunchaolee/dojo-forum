class SetupReplisCountOnPost < ActiveRecord::Migration[5.1]
  def change

    Post.pluck(:id).each do |i|
      Post.reset_counters(i, :replies)
    end

  end
end
