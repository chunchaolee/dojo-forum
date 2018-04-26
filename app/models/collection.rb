class Collection < ApplicationRecord

  # 一個collection只屬於一個user
  belongs_to :user

end
