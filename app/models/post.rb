class Post < ApplicationRecord

  # 一個post只屬於一個user
  belongs_to :user

end
