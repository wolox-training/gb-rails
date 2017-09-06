class ModelMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #

  def new_rent_notification(rent, today)
    @rent = rent
    @today = today
    mail to: 'gabriel.browarnik@wolox.com.ar', subject: 'New rent created'
  end
end
