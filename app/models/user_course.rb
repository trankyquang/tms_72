class UserCourse < ApplicationRecord

  belongs_to :user
  belongs_to :course
  has_many :user_subjects, dependent: :destroy
  has_many :activities, dependent: :destroy
  validates :status, presence: true
end
