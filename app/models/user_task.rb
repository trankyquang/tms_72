class UserTask < ApplicationRecord

  has_many :activities, dependent: :destroy
  belongs_to :user
  belongs_to :user_subject
  has_many :tasks, dependent: :destroy
  validates :status, presence: true
end
