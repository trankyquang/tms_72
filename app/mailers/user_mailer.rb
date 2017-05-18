class UserMailer < ApplicationMailer
  default from: Settings.mail_from

  def mail_daily
    User.supervisor.each do |supervisor|
      @supervisor = supervisor
      @user_tasks = UserTask.task_finish_on_day
      mail to: @supervisor.email, subject: t("mailer.mail_daily")
    end
  end

  def asign_to_course user, course
    @user = user
    @course = course
    mail to: @user.email, subject: t("mailer.assign_to_course",
      name: @course.name)
  end

  def reject_from_course user, course
    @user = user
    @course = course
    mail to: @user.email, subject: t("mailer.reject_from_course",
      name: @course.name)
  end
end
