class User < ApplicationRecord
  has_secure_password # パスワード暗号化
  has_one_attached :image 

  has_many :questions, dependent: :destroy
  has_many :comments

  # validate :nickname, presence
  # validate :email, uniqueness: true

end


# authenticateメソッドで確認可能