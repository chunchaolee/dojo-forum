class Reply < ApplicationRecord

  # 一筆reply只屬於一個user
  belongs_to :user

end
