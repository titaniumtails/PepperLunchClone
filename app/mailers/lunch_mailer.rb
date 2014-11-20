class LunchMailer < ActionMailer::Base
  default from: "chefs@pepperlunch.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lunch_mailer.data_update_notification.subject
  #
  def data_update_notification
    @greeting = "Oi Pepper Luncher"

    mail to: "songyeep@gmail.com"

  end

  def usermail_update_notification(user)
    @greeting = "Hello Pepper Luncher"

    @lunch_count = user.lunches.count

    mail to: user.email
  end

end
