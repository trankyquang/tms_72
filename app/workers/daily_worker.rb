class DailyWorker
  include Sidekiq::Worker

  def perform action
    case action
    when Settings.batch_job.daily
      send_mail_daily
    end
  end

  private
  def send_mail_daily
    UserMailer.mail_daily.deliver
  end
end
