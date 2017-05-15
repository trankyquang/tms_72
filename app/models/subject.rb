class Subject < ApplicationRecord
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects
  has_many :tasks, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects
  accepts_nested_attributes_for :tasks, allow_destroy: true

  scope :recent, ->{order created_at: :desc}
  
  acts_as_paranoid
  validates :name, presence: true,
    length: {maximum: Settings.validates.subject_name_max_length}
  validates :description, presence: true,
    length: {maximum: Settings.validates.subject_description_max_length}
end
