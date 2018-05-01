class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  mount_uploader :avatar, PhotoUploader

  # 一個user可以有很多筆posts資訊
  has_many :posts, dependent: :destroy

  # 一個user可以有很多筆posts資訊
  has_many :drafts, dependent: :destroy

  # 一個user可以有很多replies
  has_many :replies, dependent: :destroy

  # 一個user可以提出很多筆friendships
  has_many :friendships, dependent: :destroy
  # 一個user可以接收到很多筆friendships
  has_many :apply_friends, through: :friendships
  # 一個user可以有很多friend
  has_many :friends, through: :friendships

  # 一個user可以有很多collections
  has_many :collections, dependent: :destroy
  # 一個user可以collect很多post
  has_many :collected_posts, through: :collections, source: :post
  



end
