class NotificationMailer < ApplicationMailer
  default to: 'admin@example.com'
  def job_done(importer_name)
    @importer_name = importer_name

    mail(subject: "#{importer_name} import job done")
  end
end
