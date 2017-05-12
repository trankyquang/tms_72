class Subject < ApplicationRecord

  belongs_to :course_subject
  has_many :tasks, dependent: :destroy
  belongs_to :user_subject
  validates :name, presence: true
end
