class Post < ApplicationRecord

  # 一個post只屬於一個user
  belongs_to :user

  # 一個post有很多replies
  has_many :replies, dependent: :destroy

end
