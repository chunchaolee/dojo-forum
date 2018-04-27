class Category < ApplicationRecord

  validates_presence_of :name

  # 一個category可以有很多個Post_categories
  has_many :post_categories

end
