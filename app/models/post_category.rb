class PostCategory < ApplicationRecord

  # 一筆post_categories只屬於一筆post
  belongs_to :post

end
