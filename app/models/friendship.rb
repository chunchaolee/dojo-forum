class Friendship < ApplicationRecord

  # 提出的每一筆friendship只來自一個user
  belongs_to :user

  # 每一個friend只會對應到一筆friendship
  belongs_to :friend, class_name: "User"

end
