class Draft < ApplicationRecord

  # 一個draft只屬於一個user
  belongs_to :user

end
