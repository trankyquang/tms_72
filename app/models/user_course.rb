class UserCourse < ApplicationRecord

  belongs_to :user
  belongs_to :course
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :activities, dependent: :destroy

  after_create :send_mail_asign
  before_destroy :send_mail_reject

  private
  def send_mail_asign
    TraineesWorker.perform_async UserWorker::Settings.batch_job.assign_to_course,
      self.user_id, self.course_id
  end

  def send_mail_reject
    TraineesWorker.perform_async UserWorker::Settings.batch_job.assign_to_course,
      self.user_id, self.course_id
  end
end
