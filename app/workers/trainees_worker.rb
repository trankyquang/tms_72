class TraineesWorker
  include Sidekiq::Worker

  def perform action, user_id, course_id
    case action
    when Settings.batch_job.assign_to_course
      send_email_assigned user_id, course_id
    when Settings.batch_job.reject_from_course
      send_email_rejected user_id, course_id
    end
  end

  private
  def send_email_assigned user_id, course_id
    @user = User.find_by id: user_id
    @course = Course.find_by id: course_id
    UserMailer.asign_to_course(@user, @course).deliver
  end

  def send_email_rejected user_id, course_id
    @user = User.find_by id: user_id
    @course = Course.find_by id: course_id
    UserMailer.reject_from_course(@user, @course).deliver
  end

end
