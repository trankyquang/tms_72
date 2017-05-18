namespace :mail_task do

  desc "TODO"
  task mail_daily: :environment do
    DailyWorker.perform_async DailyWorker::Settings.batch_job.daily
  end

end
