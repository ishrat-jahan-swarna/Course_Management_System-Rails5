class User < ApplicationRecord
  has_secure_password
  has_one   :user_profile

  has_many  :course_users
  has_many  :courses, through:  :course_users

  has_many  :chatroom_users
  has_many  :chatrooms, through: :chatroom_users
  has_many  :messages
end
