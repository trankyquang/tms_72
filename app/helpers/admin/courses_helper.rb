module Admin::CoursesHelper

  def load_course_subject_status subject_id
    course_subject = CourseSubject.find_by subject_id: subject_id
    return nil unless course_subject.present?
    course_subject.status
  end

  def load_course_subject subject_id
    course_subject = CourseSubject.find_by subject_id: subject_id
    return nil unless course_subject.present?
    course_subject
  end
end
