class Category < ApplicationRecord

  validates_presence_of :name

  # 一個category可以有很多個Post_categories
  has_many :post_categories
  # 一個category可以有很多post
  has_many :posts, through: :post_categories, source: :post

end
