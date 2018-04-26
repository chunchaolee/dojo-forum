class Post < ApplicationRecord

  # 一個post只屬於一個user
  belongs_to :user

  # 一個post有很多replies
  has_many :replies, dependent: :destroy

  # 一個post可以有很多post_categories
  has_many :post_categories, dependent: :destroy
  # 一個post可以有很多category
  has_many :categories, through: :post_categories, source: :category

  # 一個post可以有很collection
  has_many :collections, dependent: :destroy

end
