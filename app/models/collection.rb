class Collection < ApplicationRecord

  # 每個user只能collect一個post一次
  validates :post_id, uniqueness: { scope: :user_id }

  # 一個collection只屬於一個user
  belongs_to :user

  # 一個collection只對應一筆post
  belongs_to :post, optional: true

end
