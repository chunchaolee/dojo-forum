class Reply < ApplicationRecord

  validates_presence_of :comment

  # 一筆reply只屬於一個user
  belongs_to :user, :counter_cache => true

  # 一筆reply只屬於一個post
  belongs_to :post, :counter_cache => true

  def replied_user
    User.find(self.user_id)
  end

end
