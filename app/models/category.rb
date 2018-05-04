class Category < ApplicationRecord

  validates_presence_of :name

  # 一個category可以有很多post
  has_and_belongs_to_many :posts

end
