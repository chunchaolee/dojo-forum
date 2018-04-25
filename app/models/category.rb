class Category < ApplicationRecord

  # 一個category可以有很多個Post_categories
  has_many :post_categories, dependent: :destroy

end
