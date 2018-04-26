class PostCategory < ApplicationRecord

  # 一筆post_categories只屬於一筆post
  belongs_to :post

  # 一筆post_categories只屬於一筆post
  belongs_to :draft

  # 一筆post_categories只歸類於一個category
  belongs_to :category

end
