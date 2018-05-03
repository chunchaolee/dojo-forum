class Post < ApplicationRecord

  mount_uploader :img, PhotoUploader

  # 一個post只屬於一個user
  belongs_to :user, optional: true

  # 一個post有很多replies
  has_many :replies, dependent: :destroy

  # 一個post可以有很多post_categories
  # has_many :post_categories, dependent: :destroy
  # 一個post可以有很多category
  # has_many :categories, through: :post_categories, source: :category
  has_and_belongs_to_many :categories

  # 一個post可以有很collection
  has_many :collections, dependent: :destroy

  def count_view
    self.viewed_count += 1
    self.save
  end

end
