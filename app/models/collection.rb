class Collection < ApplicationRecord

  # 一個collection只屬於一個user
  belongs_to :user

  # 一個collection只對應一筆post
  belongs_to :post

end
