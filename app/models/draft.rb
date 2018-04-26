class Draft < ApplicationRecord

  # 一個draft只屬於一個user
  belongs_to :user

  # 一個post可以有很多post_categories
  has_many :post_categories

end
