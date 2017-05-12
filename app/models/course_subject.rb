class CourseSubject < ApplicationRecord
  
  belongs_to :course
  has_many :subjects, dependent: :destroy
  has_many :activities, dependent: :destroy
end
