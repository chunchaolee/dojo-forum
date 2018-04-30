class Reply < ApplicationRecord

  validates_presence_of :comment

  # 一筆reply只屬於一個user
  belongs_to :user

  # 一筆reply只屬於一個post
  belongs_to :post, :counter_cache => true

end
