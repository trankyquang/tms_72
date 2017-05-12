class Activity < ApplicationRecord
  
  belongs_to :user
  belongs_to :user_course
  belongs_to :user_subject
  belongs_to :user_task
end
