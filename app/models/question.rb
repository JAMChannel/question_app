class Question < ApplicationRecord
  belongs_to :user
  has_one_attached :image 

  has_many :comments

  # def user
  #   return User.find_by(id: self.user_id)
  # end
end
