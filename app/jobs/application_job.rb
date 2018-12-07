class ApplicationJob < ActiveJob::Base
  queue_as :default

  after_perform :notify_manager

  private

  def notify_manager
    NotificationMailer.job_done(
      self.class.name.gsub(/Import/, '').gsub(/Job/, '')
    ).deliver_later
  end
end
