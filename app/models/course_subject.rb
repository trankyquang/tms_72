class CourseSubject < ApplicationRecord

  belongs_to :course
  belongs_to :subject

  enum status: {pending: 0, started: 1, finished: 2}

  after_update :update_status_of_user_subject

  def update_status_of_user_subject
    if CourseSubject.statuses[self.status] != 0
      UserSubject.where("user_subjects.subject_id = ?", self.subject_id)
        .update_all status: CourseSubject.statuses[self.status]
    end
  end
end
