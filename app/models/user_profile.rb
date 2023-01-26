class UserProfile < ApplicationRecord
  belongs_to :department
  belongs_to :user

  has_one_attached  :profile_picture
  #validates :correct_image_type


  private
  def correct_image_type
    if profile_picture.attached? && !profile_picture.content_type.in?(%w(profile_picture/jpeg))
      errors.add(:profile_picture, 'must be a type of jpeg or png.')
    elsif profile_picture.attached? == false
      errors.add(:profile_picture, 'must have an image.')
    end
  end
end
